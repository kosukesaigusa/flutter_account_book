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
  List<Expense> expensesOfDay = [];

  /// 表示中の月・日の収入一覧
  List<Income> incomes = [];
  List<Income> incomesOfDay = [];

  /// 表示中の月の日付ごとの収入の合計
  final incomeMap = <int, int>{};

  /// 表示中の月の日付ごとの支出の合計
  final expenseMap = <int, int>{};

  /// 表示中の月の支出・収入を取得する
  Future<void> fetchExpensesAndIncomes() async {
    getReady();
    expenses = await fetchExpenses(year, month);
    incomes = await fetchIncomes(year, month);
    aggregateExpenses();
    aggregateIncomes();
    gotReady();
    notifyListeners();
  }

  /// expenseMap を集計してカレンダーの各セルに表示する内容と
  /// カレンダー下部に表示する指定された日付の収入のリストを作成する
  void aggregateExpenses() {
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
    }
  }

  /// incomeMap を集計してカレンダーの各セルに表示する内容と
  /// カレンダー下部に表示する指定された日付の収入のリストを作成する
  void aggregateIncomes() {
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
