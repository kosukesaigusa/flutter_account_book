import 'package:flutter/material.dart';
import 'package:flutter_account_book/controllers/sign_in/sign_in_page_controller.dart';
import 'package:ks_flutter_commons/ks_flutter_commons.dart';
import 'package:provider/provider.dart';
import 'package:sign_button/sign_button.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  static const path = '/sign-in/';
  static const name = 'SignInPage';

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
                final result = await context.read<SignInPageController>().submit();
                if (!result) {
                  return;
                }
                RootWidget.restart(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
