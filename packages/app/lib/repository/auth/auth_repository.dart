import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_account_book/constatnts/string/string.dart';
import 'package:flutter_account_book/controllers/common/firebase/firebase_task_result.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  AuthRepository();

  static final auth = FirebaseAuth.instance;

  /// Google サインイン
  static Future<FirebaseTaskResult<UserCredential>> signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return const FirebaseTaskResult<UserCredential>.failure(message: generalErrorMessage);
      }
      final googleAuth = await googleUser.authentication;
      final oAuthCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential = await FirebaseAuth.instance.signInWithCredential(oAuthCredential);
      return FirebaseTaskResult<UserCredential>.success(
        contents: userCredential,
        message: 'サインインしました。',
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-disabled') {
        return FirebaseTaskResult<UserCredential>.failure(
          message: 'そのアカウントはご使用になれません。',
          code: e.code,
        );
      } else if (e.code == 'user-not-found') {
        return FirebaseTaskResult<UserCredential>.failure(
          message: '入力されたメールアドレスのユーザーは見つかりません。',
          code: e.code,
        );
      } else if (e.code == 'wrong-password') {
        return FirebaseTaskResult<UserCredential>.failure(
          message: 'パスワードが正しくありません。',
          code: e.code,
        );
      } else if (e.code == 'too-many-requests') {
        return FirebaseTaskResult<UserCredential>.failure(
          message: '認証失敗の回数が一定を超えました。'
              'しばらくして再度サインインしてください。',
          code: e.code,
        );
      } else {
        return FirebaseTaskResult<UserCredential>.failure(
          message: generalErrorMessage,
          code: e.code,
        );
      }
    } on Exception {
      return const FirebaseTaskResult<UserCredential>.failure(
        message: generalErrorMessage,
      );
    }
  }

  /// サインアウト
  static Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException {
      rethrow;
    } on Exception {
      rethrow;
    }
  }
}
