import '../firestore/models/expense.dart';

/// Expense といっているが、DailySummary を日付分だけ保持するクラス。
class MonthlyExpense {
  const MonthlyExpense({
    required this.year,
    required this.month,
    this.dailySummaries = const <DailySummary>[],
  });

  final int year;
  final int month;
  final List<DailySummary> dailySummaries;
}

/// Expense といっているが、日毎（カレンダーの各セル）の
/// 日付、支出一覧、収入一覧を一緒にもつクラス。
class DailySummary {
  DailySummary({
    required this.day,
    required this.expenses,
    this.totalExpense = 0,
  });

  final int day;
  final List<Expense> expenses;
  int totalExpense;
}
