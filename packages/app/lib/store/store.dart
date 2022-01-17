import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Store extends ChangeNotifier {
  factory Store() => _instance;
  Store._internal();
  static final Store _instance = Store._internal();

  FirebaseFirestore get db => FirebaseFirestore.instance;
  String get uuid => const Uuid().v4();

  /// Firebase Authentication が管理する現在のユーザー。
  /// 勘弁のため Non-null operator を使っているので、
  /// サインアウトしている可能性がある画面では使用しないように注意する。
  User get currentUser => FirebaseAuth.instance.currentUser!;

  /// 現在開いている BottomNavigationBar のタブ番号
  int tabIndex = 0;

  /// BottomNavigationBar のタブの切り替え
  void changeTab(int index) {
    tabIndex = index;
    notifyListeners();
  }
}
