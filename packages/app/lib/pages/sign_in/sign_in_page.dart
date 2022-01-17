import 'package:flutter/material.dart';
import 'package:flutter_account_book/pages/home/home_page.dart';
import 'package:flutter_account_book/store/store.dart';
import 'package:flutter_account_book/utils/utility_methods.dart';
import 'package:sign_button/sign_button.dart';

class SignInPage extends StatelessWidget {
  final store = Store();
  @override
  Widget build(BuildContext context) {
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
                if (!await networkConnected) {
                  showFloatingSnackBar(context, 'ネットワーク接続がありません。');
                  return;
                }
                final result = await store.signInWithGoogle();
                if (result == null) {
                  showFloatingSnackBar(context, 'サインインに失敗しました。');
                  return;
                }
                final user = result.user;
                if (user == null) {
                  showFloatingSnackBar(context, 'サインインに失敗しました。');
                  return;
                }
                await pushPageAndReoveAll(
                  context: context,
                  page: HomePage(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
