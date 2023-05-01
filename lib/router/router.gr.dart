// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter_account_book/calendar/ui/calendar_page.dart' as _i1;
import 'package:flutter_account_book/expense/ui/expense_form.dart' as _i3;
import 'package:flutter_account_book/sign_in/ui/sign_in.dart' as _i2;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    CalendarRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CalendarPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.SignInPage(),
      );
    },
    ExpenseFormRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ExpenseFormPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.CalendarPage]
class CalendarRoute extends _i4.PageRouteInfo<void> {
  const CalendarRoute({List<_i4.PageRouteInfo>? children})
      : super(
          CalendarRoute.name,
          initialChildren: children,
        );

  static const String name = 'CalendarRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SignInPage]
class SignInRoute extends _i4.PageRouteInfo<void> {
  const SignInRoute({List<_i4.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ExpenseFormPage]
class ExpenseFormRoute extends _i4.PageRouteInfo<void> {
  const ExpenseFormRoute({List<_i4.PageRouteInfo>? children})
      : super(
          ExpenseFormRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExpenseFormRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
