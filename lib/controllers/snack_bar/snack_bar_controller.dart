import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

const snackBarBehavior = SnackBarBehavior.floating;
const defaultSnackBarDuration = Duration(seconds: 3);

class SnackBarController {
  final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> show(
    String message, {
    bool removeCurrentSnackabar = true,
    Duration duration = defaultSnackBarDuration,
  }) {
    if (removeCurrentSnackabar) {
      scaffoldMessengerKey.currentState!.removeCurrentSnackBar();
    }
    return scaffoldMessengerKey.currentState!.showSnackBar(SnackBar(
      content: Text(message),
      behavior: snackBarBehavior,
      duration: duration,
    ));
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showByFirebaseException(
      FirebaseException e) {
    return show('[${e.code}]: ${e.message ?? 'FirebaseException が発生しました。'}');
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showByException(Exception e) {
    return show('[${e.toString()}]: エラーが発生しました。');
  }

  void remove() {
    scaffoldMessengerKey.currentState!.removeCurrentSnackBar();
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? showMessage(dynamic message) {
    return show('$message'.replaceAll('Exception:', ''));
  }
}
