import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../loading/ui/loading.dart';
import '../scaffold_messenger_controller.dart';

final _authProvider = Provider<FirebaseAuth>((_) => FirebaseAuth.instance);

final authUserProvider = StreamProvider<User?>(
  (ref) => ref.watch(_authProvider).userChanges(),
);

final userIdProvider = Provider<AsyncValue<String?>>(
  (ref) => ref.watch(authUserProvider).whenData((user) => user?.uid),
);

final isSignedInProvider = Provider(
  (ref) => ref.watch(userIdProvider).whenData((userId) => userId != null),
);

final signOutProvider = Provider.autoDispose<Future<void> Function()>(
  (ref) => () async {
    try {
      ref
          .read(showOverlayLoadingStateProvider.notifier)
          .update((state) => true);
      await ref.watch(_authProvider).signOut();
    } finally {
      ref
          .read(showOverlayLoadingStateProvider.notifier)
          .update((state) => false);
    }
  },
);

final signInWithGoogleProvider = Provider<Future<UserCredential?> Function()>(
  (ref) => () async {
    ref.read(showOverlayLoadingStateProvider.notifier).update((state) => true);
    try {
      await Future<void>.delayed(const Duration(seconds: 3));
      final googleProvider = GoogleAuthProvider()
        ..addScope('https://www.googleapis.com/auth/contacts.readonly');
      final userCredential =
          await FirebaseAuth.instance.signInWithPopup(googleProvider);
      return userCredential;
    } on Exception catch (e) {
      ref
          .read(mainScaffoldMessengerControllerProvider)
          .showSnackBarByException(e);
      return null;
    } finally {
      ref
          .read(showOverlayLoadingStateProvider.notifier)
          .update((state) => false);
    }
  },
);
