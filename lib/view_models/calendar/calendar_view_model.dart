import 'package:cloud_firestore/cloud_firestore.dart';
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

  /// カレンダーに表示するデータを準備中かどうか
  bool ready = false;

  /// 表示・選択中の年月日
  int year = DateTime.now().year;
  int month = DateTime.now().month;
  int day = DateTime.now().day;

  /// 表示中の月・日の支出一覧
  List<Expense> expenses = [];
  final List<Expense> expensesOfDay = [];

  /// 表示中の月・日の収入一覧
  List<Income> incomes = [];
  final List<Income> incomesOfDay = [];

  /// 表示中の月の日付ごとの収入の合計
  final incomeMap = <int, int>{};

  /// 表示中の月の日付ごとの支出の合計
  final expenseMap = <int, int>{};

  /// 表示中の月の変動費の合計金額
  int totalExpensePrice = 0;

  /// 表示中の月の固定費の合計金額
  int totalFixedFeePrice = 106663;

  /// 表示中の月の収入の合計金額
  int totalIncomePrice = 0;

  /// 表示中の月の固定費の合計金額

  /// 表示中の月の支出・収入を取得する
  Future<void> fetchExpensesAndIncomes({Source source = Source.serverAndCache}) async {
    getReady();
    expenses = await fetchExpenses(year, month, source: source);
    incomes = await fetchIncomes(year, month, source: source);
    aggregateExpenses();
    aggregateIncomes();
    gotReady();
    notifyListeners();
  }

  /// expenses を集計して
  ///
  /// - カレンダーの各セルに表示する内容
  /// - カレンダー上部に表示する支出のサマリー
  /// - カレンダー下部に表示する指定された日付の支出のリスト
  ///
  /// を作成する
  void aggregateExpenses() {
    totalExpensePrice = 0;
    expenseMap.clear();
    expensesOfDay.clear();
    for (final expense in expenses) {
      final paidAt = expense.paidAt;
      if (paidAt != null) {
        final price = expenseMap[paidAt.day];
        if (price == null) {
          expenseMap[paidAt.day] = expense.price;
        } else {
          expenseMap[paidAt.day] = price + expense.price;
        }
        if (paidAt.day == day) {
          expensesOfDay.add(expense);
        }
      }
      totalExpensePrice += expense.price;
    }
  }

  /// incomes を集計して
  ///
  /// - カレンダーの各セルに表示する内容
  /// - カレンダー上部に表示する収入のサマリー
  /// - カレンダー下部に表示する指定された日付の収入のリスト
  ///
  /// を作成する
  void aggregateIncomes() {
    totalIncomePrice += 0;
    incomeMap.clear();
    incomesOfDay.clear();
    for (final income in incomes) {
      final earnedAt = income.earnedAt;
      if (earnedAt != null) {
        final price = incomeMap[earnedAt.day];
        if (price == null) {
          incomeMap[earnedAt.day] = income.price;
        } else {
          incomeMap[earnedAt.day] = price + income.price;
        }
        if (earnedAt.day == day) {
          incomesOfDay.add(income);
        }
      }
      totalIncomePrice += income.price;
    }
  }

  /// カレンダー下部に表示する指定された日付の支出のリストを更新する
  void aggregateExpensesOfDay() {
    expensesOfDay.clear();
    for (final expense in expenses) {
      final paidAt = expense.paidAt;
      if (paidAt != null) {
        if (paidAt.day == day) {
          expensesOfDay.add(expense);
        }
      }
    }
  }

  /// カレンダー下部に表示する指定された日付の収入のリストを更新する
  void aggregateIncomesOfDay() {
    incomesOfDay.clear();
    for (final income in incomes) {
      final earnedAt = income.earnedAt;
      if (earnedAt != null) {
        if (earnedAt.day == day) {
          incomesOfDay.add(income);
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
    aggregateExpensesOfDay();
    aggregateIncomesOfDay();
    notifyListeners();
  }

  Future<void> showNextMonth() async {
    final nextMonth = DateTime(year, month + 1);
    year = nextMonth.year;
    month = nextMonth.month;
    day = 1;
    await fetchExpensesAndIncomes();
    notifyListeners();
  }

  Future<void> showPreviousMonth() async {
    final previousMonth = DateTime(year, month - 1);
    year = previousMonth.year;
    month = previousMonth.month;
    day = 1;
    await fetchExpensesAndIncomes();
    notifyListeners();
  }

  void getReady() {
    ready = false;
    notifyListeners();
  }

  void gotReady() {
    ready = true;
    notifyListeners();
  }
}
