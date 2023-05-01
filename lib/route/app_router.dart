import 'package:flutter/material.dart';
import 'package:flutter_account_book/pages/not_found/not_found_page.dart';
import 'package:flutter_account_book/route/utils.dart';
import 'package:flutter_account_book/utils/types.dart';
import 'package:ks_flutter_commons/ks_flutter_commons.dart';

abstract class AppRouter {
  factory AppRouter.create(Map<String, PageBuilder> routeMap) => _AppRouterImpl(routeMap);

  static const initialRoute = '/';
  Route<dynamic> generateRoute(RouteSettings settings);
}

class _AppRouterImpl implements AppRouter {
  _AppRouterImpl(Map<String, PageBuilder> routeMap)
      : appRoutes = <AppRoute>[for (final key in routeMap.keys) AppRoute(key, routeMap[key]!)];

  final List<AppRoute> appRoutes;

  @override
  Route<dynamic> generateRoute(RouteSettings settings) {
    var path = settings.name!;
    print('*****************************');
    print('path: $path');
    print('*****************************');

    // path に ? がついている場合は、それ以降をクエリストリングとみなし、
    // 分割して `queryParams` というマップに追加する。
    // path は ? 以前の文字列で上書きしておく。
    // 現状 fullScreenDialog=true くらいしか使いみちはない。
    var queryParams = <String, dynamic>{};
    if (path.contains('?')) {
      queryParams = Uri.parse(path).queryParameters;
      path = path.split('?').first;
    }

    // ページに渡す引数の Map<String, dyamic>
    final data = (settings.arguments as RouteArgs?)?.data ?? <String, dynamic>{};

    try {
      // appRoutes の各要素のパスに一致する AppRoute を見つけて
      // 遷移先の Widget の MaterialPageRoute を返す
      final appRoute = appRoutes.firstWhere(
        (appRoute) => appRoute.path == path,
        orElse: () => throw RouteNotFoundException(path),
      );
      final route = MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => appRoute.pageBuilder(context, RouteArgs(data)),
        fullscreenDialog: toBool(queryParams['fullScreenDialog'] ?? false),
      );
      return route;
    } on RouteNotFoundException {
      final route = MaterialPageRoute<void>(
        settings: settings,
        builder: (context) => const NotFoundPage(),
      );
      return route;
    }
  }
}
