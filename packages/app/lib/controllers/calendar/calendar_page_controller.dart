import 'package:flutter_account_book/controllers/calendar/calendar_page_state.dart';
import 'package:flutter_account_book/controllers/snack_bar/snack_bar_controller.dart';
import 'package:flutter_account_book/repository/auth/auth_repository.dart';
import 'package:flutter_account_book/repository/expense/expense_repository.dart';
import 'package:state_notifier/state_notifier.dart';

class CalendarPageController extends StateNotifier<CalendarPageState> with LocatorMixin {
  CalendarPageController() : super(const CalendarPageState());

  SnackBarController get snackBarController => read();

  @override
  void initState() {
    final now = DateTime.now();
    state = state.copyWith(
      year: now.year,
      month: now.month,
      day: now.day,
    );
    super.initState();
  }

  /// 指定した月の支出を取得して...
  Future<void> fetchExpenses() async {
    final now = DateTime.now();
    final thisMonthString = DateTime(
      state.year ?? now.year,
      state.month ?? now.month,
    ).toIso8601String();
    final nextMonthString = DateTime(
      state.year ?? now.year + 1,
      state.month ?? now.month + 1,
    ).toIso8601String();
    final expenses = await ExpenseRepository.fetchExpenses(
        userId: AuthRepository.nonNullUser.uid,
        queryBuilder: (expenseQuery) {
          return expenseQuery
              .wherePaidAt(isGreaterThanOrEqualTo: thisMonthString)
              .wherePaidAt(isLessThan: nextMonthString)
              .orderByPaidAt()
              .orderByCreatedAt();
        });
  }

  /// 指定した月の収入を取得して...
  Future<void> fetchIncomes() async {}

  /// 前の月を選択する
  void showPreviousMonth() {
    final now = DateTime.now();
    final dateTime = DateTime(state.year ?? now.year, (state.month ?? now.month) - 1);
    state = state.copyWith(
      year: dateTime.year,
      month: dateTime.month,
    );
  }

  /// 次の月を選択する
  void showNextMonth() {
    final now = DateTime.now();
    final dateTime = DateTime(state.year ?? now.year, (state.month ?? now.month) + 1);
    state = state.copyWith(
      year: dateTime.year,
      month: dateTime.month,
    );
  }
}
