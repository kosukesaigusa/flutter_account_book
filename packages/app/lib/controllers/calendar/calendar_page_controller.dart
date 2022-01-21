import 'package:flutter_account_book/controllers/calendar/calendar_page_state.dart';
import 'package:flutter_account_book/controllers/snack_bar/snack_bar_controller.dart';
import 'package:flutter_account_book/models/v2/daily_expense_summary/daily_expense_summary.dart';
import 'package:flutter_account_book/repository/auth/auth_repository.dart';
import 'package:flutter_account_book/repository/expense/expense_repository.dart';
import 'package:flutter_account_book/repository/income/income_repository.dart';
import 'package:ks_flutter_commons/ks_flutter_commons.dart';
import 'package:state_notifier/state_notifier.dart';

class CalendarPageController extends StateNotifier<CalendarPageState> with LocatorMixin {
  CalendarPageController() : super(const CalendarPageState());

  SnackBarController get snackBarController => read();

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    final dailySummaries = List.generate(
      lastDayOfMonth(now.year, now.month),
      (i) => DailySummary(day: i + 1, expenses: [], incomes: []),
    );
    state = state.copyWith(
      year: now.year,
      month: now.month,
      day: now.day,
      dailySummaries: dailySummaries,
      monthlyExpense:
          MonthlyExpense(year: now.year, month: now.month, dailySummaries: dailySummaries),
    );
    fetch();
  }

  Future<void> fetch() async {
    await Future.wait([fetchExpenses(), fetchIncomes()]);
    state = state.copyWith(loading: false);
  }

  /// 指定した月の支出を取得して...
  Future<void> fetchExpenses() async {
    final thisMonthString = DateTime(state.year, state.month).toIso8601String();
    final nextMonthString = DateTime(state.year, state.month + 1).toIso8601String();
    final expenses = await ExpenseRepository.fetchExpenses(
      userId: AuthRepository.uid,
      queryBuilder: (q) => q
          .wherePaidAt(isGreaterThanOrEqualTo: thisMonthString)
          .wherePaidAt(isLessThan: nextMonthString)
          // .orderByCreatedAt()
          .orderByPaidAt(),
    );
    for (final expense in expenses) {
      final paidAt = expense.paidAt;
      if (paidAt != null) {
        final day = DateTime.parse(paidAt).day;
        final dailySummaries = state.dailySummaries;
        final monthlyExpense = state.monthlyExpense;
        dailySummaries[day - 1].expenses.add(expense);
        dailySummaries[day - 1].totalExpense += expense.price;
        monthlyExpense.dailySummaries[day - 1] = dailySummaries[day - 1];
        state = state.copyWith(dailySummaries: dailySummaries, monthlyExpense: monthlyExpense);
      }
    }
  }

  /// 指定した月の収入を取得して...
  Future<void> fetchIncomes() async {
    final thisMonthString = DateTime(state.year, state.month).toIso8601String();
    final nextMonthString = DateTime(state.year, state.month + 1).toIso8601String();
    final incomes = await IncomeRepository.fetchIncomes(
      userId: AuthRepository.uid,
      queryBuilder: (q) => q
          .whereEarnedAt(isGreaterThanOrEqualTo: thisMonthString)
          .whereEarnedAt(isLessThan: nextMonthString)
          // .orderByCreatedAt()
          .orderByEarnedAt(),
    );
    for (final income in incomes) {
      final earnedAt = income.earnedAt;
      if (earnedAt != null) {
        final day = DateTime.parse(earnedAt).day;
        final dailySummaries = state.dailySummaries;
        final monthlyExpense = state.monthlyExpense;
        dailySummaries[day - 1].incomes.add(income);
        dailySummaries[day - 1].totalExpense += income.price;
        monthlyExpense.dailySummaries[day - 1] = dailySummaries[day - 1];
        state = state.copyWith(dailySummaries: dailySummaries, monthlyExpense: monthlyExpense);
      }
    }
  }

  /// 前の月を選択する
  void showPreviousMonth() {
    final dateTime = DateTime(state.year, (state.month) - 1);
    state = state.copyWith(
      year: dateTime.year,
      month: dateTime.month,
    );
  }

  /// 次の月を選択する
  void showNextMonth() {
    final dateTime = DateTime(state.year, (state.month) + 1);
    state = state.copyWith(
      year: dateTime.year,
      month: dateTime.month,
    );
  }

  /// 日付を選択する
  void onCalendarCellTapped(int day) {
    state = state.copyWith(day: day);
  }
}
