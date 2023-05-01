import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../date_time.dart';
import '../expense/daily_expense_summary.dart';
import '../firestore/repositories/expense_repository.dart';
import 'calendar.dart';

final calendarStateNotifierProvider =
    StateNotifierProvider.autoDispose<CalendarStateNotifier, CalendarState>(
  (ref) => CalendarStateNotifier(ref: ref),
);

class CalendarStateNotifier extends StateNotifier<CalendarState> {
  CalendarStateNotifier({
    required AutoDisposeStateNotifierProviderRef<CalendarStateNotifier,
            CalendarState>
        ref,
  })  : _ref = ref,
        super(const CalendarState()) {
    final now = DateTime.now();
    state = state.copyWith(year: now.year, month: now.month, day: now.day);
    state = state.copyWith(
      year: now.year,
      month: now.month,
      day: now.day,
      dailySummaries: _generateEmptyDailySummaries(),
      monthlyExpense: MonthlyExpense(
        year: now.year,
        month: now.month,
        dailySummaries: _generateEmptyDailySummaries(),
      ),
    );
    fetch();
  }

  final AutoDisposeStateNotifierProviderRef<CalendarStateNotifier,
      CalendarState> _ref;

  /// 支出データを取得する。
  Future<void> fetch() async {
    state = state.copyWith(loading: true);
    try {
      await _fetchExpenses();
    } finally {
      state = state.copyWith(loading: false);
    }
  }

  /// 月を移動した時などにリセットする。
  Future<void> reset() async {
    state = state.copyWith(
      dailySummaries: _generateEmptyDailySummaries(),
      monthlyExpense: MonthlyExpense(
        year: state.year,
        month: state.month,
        dailySummaries: _generateEmptyDailySummaries(),
      ),
    );
    await fetch();
  }

  /// 指定した月の支出を取得して集計する。
  Future<void> _fetchExpenses() async {
    final expenses = await _ref.read(expenseRepositoryProvider).fetchExpenses(
          year: state.year,
          month: state.month,
        );
    for (final expense in expenses) {
      final day = expense.paidAt.dateTime!.day;
      final dailySummaries = state.dailySummaries;
      final monthlyExpense = state.monthlyExpense;
      dailySummaries[day - 1].expenses.add(expense);
      dailySummaries[day - 1].totalExpense += expense.price;
      monthlyExpense.dailySummaries[day - 1] = dailySummaries[day - 1];
      state = state.copyWith(
        dailySummaries: dailySummaries,
        monthlyExpense: monthlyExpense,
      );
    }
  }

  /// 前の月を選択する。
  Future<void> showPreviousMonth() async {
    final previousMonth = DateTime(state.year, (state.month) - 1);
    state = state.copyWith(
      year: previousMonth.year,
      month: previousMonth.month,
      day: previousMonth.day,
    );
    await reset();
  }

  /// 次の月を選択する。
  Future<void> showNextMonth() async {
    final nextMonth = DateTime(state.year, (state.month) + 1);
    state = state.copyWith(
      year: nextMonth.year,
      month: nextMonth.month,
      day: nextMonth.day,
    );
    await reset();
  }

  /// 日付を選択する。
  void tapCalendarCell(int day) {
    state = state.copyWith(day: day);
  }

  /// 現在の年月の日数に応じたサイズの [DailySummary] のリストを生成する。
  List<DailySummary> _generateEmptyDailySummaries() =>
      List<DailySummary>.generate(
        lastDayOfMonth(state.year, state.month),
        (i) => DailySummary(day: i + 1, expenses: []),
      );
}
