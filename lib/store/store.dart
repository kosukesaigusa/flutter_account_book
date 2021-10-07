import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uuid/uuid.dart';

class Store extends ChangeNotifier {
  factory Store() => _instance;
  Store._internal();
  static final Store _instance = Store._internal();

  FirebaseFirestore get db => FirebaseFirestore.instance;
  String get uuid => const Uuid().v4();
  String get uid => FirebaseAuth.instance.currentUser!.uid;

  /// 現在開いている BottomNavigationBar のタブ番号
  int tabIndex = 0;

  /// BottomNavigationBar のタブの切り替え
  void changeTab(int index) {
    tabIndex = index;
    notifyListeners();
  }

  /// Sign in with Google を実行して UserCredential を返す
  Future<UserCredential?> signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return null;
      }

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final result = await FirebaseAuth.instance.signInWithCredential(credential);
      return result;
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      return null;
    }
  }
}
