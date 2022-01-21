import 'package:flutter_account_book/controllers/sign_in/sign_in_page_state.dart';
import 'package:flutter_account_book/controllers/snack_bar/snack_bar_controller.dart';
import 'package:flutter_account_book/repository/auth/auth_repository.dart';
import 'package:state_notifier/state_notifier.dart';

class SignInPageController extends StateNotifier<SignInPageState> with LocatorMixin {
  SignInPageController() : super(const SignInPageState());

  SnackBarController get snackBarController => read();
  AuthRepository get authRepository => read();

  /// サインイン
  Future<bool> submit() async {
    state = state.copyWith(loading: true);
    final result = await AuthRepository.signInWithGoogle();
    return result.when(
      success: (userCredential, message, success) {
        state = state.copyWith(loading: false);
        return true;
      },
      failure: (message, code) {
        state = state.copyWith(loading: false);
        snackBarController.showMessage(code == null ? message : '($code): $message');
        return false;
      },
      error: (err) {
        state = state.copyWith(loading: false);
        snackBarController.showMessage(err);
        return false;
      },
    );
  }
}
