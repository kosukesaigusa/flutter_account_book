import 'package:flutter/material.dart';
import 'package:flutter_account_book/store/store.dart';

class CalendarViewModel extends ChangeNotifier {
  factory CalendarViewModel() => _instance;
  CalendarViewModel._internal();
  static final CalendarViewModel _instance = CalendarViewModel._internal();

  int year = DateTime.now().year;
  int month = DateTime.now().month;
  int day = DateTime.now().day;
  final store = Store();

  /// 現在表示している月の日付ごとの収入の合計
  final incomeMap = <int, int>{};

  /// 現在表示している月の日付ごとの支出の合計
  final expenseMap = <int, int>{};

  /// カレンダーの各セルの収入合計金額
  void calculateIncome(int key, int price) {
    final incomePrice = incomeMap[key];
    if (incomePrice == null) {
      incomeMap[key] = price;
    } else {
      incomeMap[key] = incomePrice + price;
    }
  }

  /// カレンダーの各セルの支出合計金額
  void calculateExpense(int key, int price) {
    final expensePrice = expenseMap[key];
    if (expensePrice == null) {
      expenseMap[key] = price;
    } else {
      expenseMap[key] = expensePrice + price;
    }
  }

  void onDateCellTapped(int number) {
    day = number;
    notifyListeners();
  }

  void showNextMonth() {
    final nextMonth = DateTime(year, month + 1);
    year = nextMonth.year;
    month = nextMonth.month;
    day = 1;
    clear();
    notifyListeners();
  }

  void showPreviousMonth() {
    final previousMonth = DateTime(year, month - 1);
    year = previousMonth.year;
    month = previousMonth.month;
    day = 1;
    clear();
    notifyListeners();
  }

  void clear() {
    incomeMap.clear();
    expenseMap.clear();
  }
}
