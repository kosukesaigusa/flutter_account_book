import 'package:flutter/material.dart';
import 'package:flutter_account_book/controllers/application/application_controller.dart';
import 'package:flutter_account_book/controllers/application/application_state.dart';
import 'package:flutter_account_book/controllers/bottom_navigation_bar/bottom_navigation_bar_controller.dart';
import 'package:flutter_account_book/controllers/bottom_navigation_bar/bottom_navigation_bar_state.dart';
import 'package:flutter_account_book/controllers/calendar/calendar_page_controller.dart';
import 'package:flutter_account_book/controllers/calendar/calendar_page_state.dart';
import 'package:flutter_account_book/controllers/sign_in/sign_in_page_controller.dart';
import 'package:flutter_account_book/controllers/sign_in/sign_in_page_state.dart';
import 'package:flutter_account_book/controllers/snack_bar/snack_bar_controller.dart';
import 'package:flutter_account_book/repository/auth/auth_repository.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

class AppMultiProvider extends StatelessWidget {
  const AppMultiProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    // 同階層ではアルファベット順にしておく
    return MultiProvider(
      providers: [
        Provider(create: (_) => GlobalKey<NavigatorState>()),
        Provider(create: (_) => SnackBarController()),
      ],
      child: MultiProvider(
        providers: [
          Provider(create: (_) => AuthRepository()),
        ],
        child: MultiProvider(
          providers: [
            StateNotifierProvider<ApplicationController, ApplicationState>(
              create: (_) => ApplicationController(),
            ),
            StateNotifierProvider<BottomNavigationBarController, BottomNavigationBarState>(
              create: (_) => BottomNavigationBarController(),
              lazy: false,
            ),
            StateNotifierProvider<SignInPageController, SignInPageState>(
              create: (_) => SignInPageController(),
            ),
            StateNotifierProvider<CalendarPageController, CalendarPageState>(
              create: (_) => CalendarPageController(),
            ),
          ],
          child: child,
        ),
      ),
    );
  }
}
