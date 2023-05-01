import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_button/sign_button.dart';

import '../../auth/auth.dart';
import '../../router/router.dart';
import '../../router/router.gr.dart';

/// サインインページ。
@RoutePage()
class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  static const path = '/signIn';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('サインイン'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SignInButton(
              buttonType: ButtonType.google,
              onPressed: () async {
                final userCredential =
                    await ref.read(signInWithGoogleProvider).call();
                if (userCredential == null) {
                  return;
                }
                await ref
                    .read(appRouterProvider)
                    .replaceAll([const CalendarRoute()]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
