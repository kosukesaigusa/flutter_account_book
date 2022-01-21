import 'package:flutter_account_book/models/v2/daily_expense_summary/daily_expense_summary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_page_state.freezed.dart';

@freezed
class CalendarPageState with _$CalendarPageState {
  const factory CalendarPageState({
    @Default(true) bool loading,
    @Default(1970) int year,
    @Default(1) int month,
    @Default(1) int day,
    @Default(<DailySummary>[]) List<DailySummary> dailySummaries,
    @Default(MonthlyExpense(year: 1970, month: 1)) MonthlyExpense monthlyExpense,
  }) = _CalendarPageState;
}
