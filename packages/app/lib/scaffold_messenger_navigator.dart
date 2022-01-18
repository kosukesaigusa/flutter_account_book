import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_account_book/controllers/snack_bar/snack_bar_controller.dart';
import 'package:flutter_account_book/pages/not_found/not_found_page.dart';
import 'package:flutter_account_book/pages/sign_in/sign_in_page.dart';
import 'package:flutter_account_book/route/app_router.dart';
import 'package:flutter_account_book/route/routes.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ks_flutter_commons/ks_flutter_commons.dart';
import 'package:provider/provider.dart';

final appRouter = AppRouter.create(routeDict);

/// Widget Tree の最上部で ScaffoldMessanger を含めるための Navigator ウィジェット。
/// 目には見えないが、アプリケーション上の全てのページがこの Scaffold の上に載るので
/// SnackBarController でどこからでもスナックバーが表示できるようになっている。
class ScaffoldMessengerNavigator extends StatelessWidget {
  const ScaffoldMessengerNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: context.select<SnackBarController, Key>((c) => c.scaffoldMessengerKey),
      child: Scaffold(
        body: AuthStateStreamBuilder(
          waitingWidget: SpinKitCircle(
            size: 48,
            color: Theme.of(context).colorScheme.primary,
          ),
          notSignedInWidget: const SignInPage(),
          builder: (context) {
            return Navigator(
              key: context.watch<GlobalKey<NavigatorState>>(),
              initialRoute: AppRouter.initialRoute,
              onGenerateRoute: appRouter.generateRoute,
              onUnknownRoute: (settings) {
                final route = MaterialPageRoute<void>(
                  settings: settings,
                  builder: (context) => const NotFoundPage(),
                );
                return route;
              },
            );
          },
        ),
      ),
    );
  }
}
