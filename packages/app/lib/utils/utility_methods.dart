import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

/// FirebaseFirestore のインスタンス
FirebaseFirestore get db => FirebaseFirestore.instance;

/// UUID V4
String get uuid => const Uuid().v4();

/// 3 秒間表示する SnackBar を表示する
void showFloatingSnackBar(
  BuildContext context,
  String message, {
  int seconds = 3,
}) {
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
