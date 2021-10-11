import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_account_book/firestore/firestore_service.dart';

class CategoryViewModel extends ChangeNotifier {
  factory CategoryViewModel() => _instance;
  CategoryViewModel._internal();
  static final CategoryViewModel _instance = CategoryViewModel._internal();

  /// 支出・収入カテゴリーを取得する
  Future<void> fetchCategories({Source source = Source.serverAndCache}) async {
    notifyListeners();
  }
}
