import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../calendar/ui/calendar_page.dart';
import '../expense/ui/expense_form.dart';
import '../sign_in/ui/sign_in.dart';
import 'router.gr.dart';

final appRouterProvider = Provider.autoDispose<AppRouter>((_) => AppRouter());

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  final List<AutoRoute> routes = [
    RedirectRoute(path: '/', redirectTo: CalendarPage.path),
    AutoRoute(path: SignInPage.path, page: SignInRoute.page),
    AutoRoute(
      path: CalendarPage.path,
      page: CalendarRoute.page,
      guards: [_AuthGuard()],
    ),
    AutoRoute(
      path: ExpenseFormPage.path,
      page: ExpenseFormRoute.page,
      guards: [_AuthGuard()],
      fullscreenDialog: true,
    ),
  ];
}

/// ログインチェックを行う [AutoRouteGuard]。
class _AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final authenticated = FirebaseAuth.instance.currentUser != null;
    if (authenticated) {
      if (resolver.route.name == SignInRoute.name) {
        router.replaceAll([const CalendarRoute()]);
      } else {
        resolver.next();
      }
      return;
    } else {
      router.push<void>(const SignInRoute());
    }
  }
}
