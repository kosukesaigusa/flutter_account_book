import 'package:auto_route/auto_route.dart';

import '../calendar/ui/calendar.dart';
import 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  final List<AutoRoute> routes = [
    RedirectRoute(path: '/', redirectTo: CalendarPage.path),
    AutoRoute(
      path: CalendarPage.path,
      page: CalendarRoute.page,
    ),
  ];
}
