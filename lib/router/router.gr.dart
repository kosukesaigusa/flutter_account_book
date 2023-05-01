// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter_account_book/calendar/ui/calendar.dart' as _i1;
import 'package:flutter_account_book/sign_in/ui/sign_in.dart' as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    CalendarRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CalendarPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.SignInPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.CalendarPage]
class CalendarRoute extends _i3.PageRouteInfo<void> {
  const CalendarRoute({List<_i3.PageRouteInfo>? children})
      : super(
          CalendarRoute.name,
          initialChildren: children,
        );

  static const String name = 'CalendarRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SignInPage]
class SignInRoute extends _i3.PageRouteInfo<void> {
  const SignInRoute({List<_i3.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
