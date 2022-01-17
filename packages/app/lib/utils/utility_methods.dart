import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

/// Navigator.push<void> する
Future<void> pushPage({
  required BuildContext context,
  required Widget page,
  bool fullscreenDialog = false,
}) async {
  await Navigator.of(context).push<void>(
    MaterialPageRoute(
      builder: (context) => page,
      fullscreenDialog: fullscreenDialog,
    ),
  );
}

Future<void> pushPageAndReoveAll({
  required BuildContext context,
  required Widget page,
}) async {
  await Navigator.pushAndRemoveUntil<void>(
    context,
    MaterialPageRoute(builder: (context) => page),
    (route) => route.isFirst,
  );
}

/// インターネットに接続しているか
Future<bool> get networkConnected async {
  final connectivity = await Connectivity().checkConnectivity();
  return connectivity != ConnectivityResult.none;
}

/// 1 秒間表示する SnackBar を表示する
void showFloatingSnackBar(BuildContext context, String message, {int seconds = 1}) {
  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: seconds),
    ));
}

/// 現在表示している SnackBar を消す
void removeCurrentSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
}
