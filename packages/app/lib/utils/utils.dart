import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

/// FirebaseFirestore のインスタンス
FirebaseFirestore get db => FirebaseFirestore.instance;

/// Firebase Authentication が管理する現在のユーザーと uid。
/// 簡便のため Non-null operator を使っているので、
/// サインアウトしている可能性がある画面では使用しないように注意する。
User get nonNullUser => FirebaseAuth.instance.currentUser!;
String get nonNullUid => FirebaseAuth.instance.currentUser!.uid;

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
