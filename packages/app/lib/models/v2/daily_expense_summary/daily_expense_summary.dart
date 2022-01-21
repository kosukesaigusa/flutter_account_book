import 'package:flutter_account_book/models/v2/expense/expense.dart';
import 'package:flutter_account_book/models/v2/income/income.dart';

/// Expense といっているが、DailyExpense を日付分だけ保持するクラス
class MonthlyExpense {
  const MonthlyExpense({
    required this.year,
    required this.month,
    this.dailyExpenses = const <DailyExpense>[],
  });

  final int year;
  final int month;
  final List<DailyExpense> dailyExpenses;
}

/// Expense といっているが、日毎（カレンダーの各セル）の
/// 日付、支出一覧、収入一覧を一緒にもつクラス
class DailyExpense {
  const DailyExpense({
    required this.day,
    required this.expenses,
    required this.incomes,
  });

  final int day;
  final List<Expense> expenses;
  final List<Income> incomes;
}
