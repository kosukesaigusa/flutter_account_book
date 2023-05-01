import 'package:freezed_annotation/freezed_annotation.dart';

import '../expense/daily_expense_summary.dart';

part 'calendar.freezed.dart';

@freezed
class CalendarState with _$CalendarState {
  const factory CalendarState({
    @Default(true) bool loading,
    @Default(1970) int year,
    @Default(1) int month,
    @Default(1) int day,
    @Default(<DailySummary>[]) List<DailySummary> dailySummaries,
    @Default(MonthlyExpense(year: 1970, month: 1))
        MonthlyExpense monthlyExpense,
  }) = _CalendarPageState;
}
