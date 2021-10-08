import 'package:flutter/material.dart';
import 'package:flutter_account_book/firestore/firestore_service.dart';
import 'package:flutter_account_book/models/expense/expense.dart';
import 'package:flutter_account_book/models/income/income.dart';
import 'package:flutter_account_book/store/store.dart';

class CalendarViewModel extends ChangeNotifier {
  factory CalendarViewModel() => _instance;
  CalendarViewModel._internal();
  static final CalendarViewModel _instance = CalendarViewModel._internal();

  final store = Store();

  /// 表示・選択中の年月日
  int year = DateTime.now().year;
  int month = DateTime.now().month;
  int day = DateTime.now().day;

  /// 表示中の月の支出一覧
  List<Expense> expenses = [];

  /// 表示中の月の収入一覧
  List<Income> incomes = [];

  /// 表示中の月の日付ごとの収入の合計
  final incomeMap = <int, int>{};

  /// 表示中の月の日付ごとの支出の合計
  final expenseMap = <int, int>{};

  /// 表示中の月の支出を取得する
  Future<void> fetchExpensesAndIncomes() async {
    expenses = await fetchExpenses(year, month);
    // incomes = await fetchIncomes(year, month);
    aggregateExpenses();
    // aggregateIncomes();
    notifyListeners();
  }

  /// expenseMap を集計する
  void aggregateExpenses() {
    for (final expense in expenses) {
      final paidAt = expense.paidAt;
      if (paidAt != null) {
        final day = paidAt.day;
        final price = expenseMap[day];
        if (price == null) {
          expenseMap[day] = expense.price;
        } else {
          expenseMap[day] = price + expense.price;
        }
      }
    }
  }

  /// incomeMap を集計する
  void aggregateIncomes() {
    for (final income in incomes) {
      final earnedAt = income.earnedAt;
      if (earnedAt != null) {
        final day = earnedAt.day;
        final price = incomeMap[day];
        if (price == null) {
          incomeMap[day] = income.price;
        } else {
          incomeMap[day] = price + income.price;
        }
      }
    }
  }

  /// カレンダーの各セルの収入合計金額
  void calculateIncome(int key, int price) {
    final incomePrice = incomeMap[key];
    if (incomePrice == null) {
      incomeMap[key] = price;
    } else {
      incomeMap[key] = incomePrice + price;
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
