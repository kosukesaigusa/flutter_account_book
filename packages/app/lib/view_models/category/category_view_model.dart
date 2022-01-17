import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_account_book/firestore/firestore_service.dart';
import 'package:flutter_account_book/models/v1/expense_category/expense_category.dart';
import 'package:flutter_account_book/models/v1/income_category/income_category.dart';

class CategoryViewModel extends ChangeNotifier {
  factory CategoryViewModel() => _instance;
  CategoryViewModel._internal();
  static final CategoryViewModel _instance = CategoryViewModel._internal();

  List<ExpenseCategory> expenseCategories = [];
  List<IncomeCategory> incomeCategories = [];

  /// 支出・収入カテゴリーを取得する
  Future<void> fetchCategories({Source source = Source.serverAndCache}) async {
    expenseCategories = await fetchExpenseCategories(source: source);
    incomeCategories = await fetchIncomeCategories(source: source);
    notifyListeners();
  }
}
