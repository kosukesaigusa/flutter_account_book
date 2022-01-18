import 'package:flutter/material.dart';
import 'package:flutter_account_book/controllers/expense_add/expense_add_page_state.dart';
import 'package:flutter_account_book/controllers/snack_bar/snack_bar_controller.dart';
import 'package:state_notifier/state_notifier.dart';

class ExpenseAddPageController extends StateNotifier<ExpenseAddPageState> with LocatorMixin {
  ExpenseAddPageController({
    required this.year,
    required this.month,
    required this.day,
  }) : super(ExpenseAddPageState(year: year, month: month, day: day));

  SnackBarController get snackBarController => read();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController priceTextEditingController = TextEditingController();

  int year = DateTime.now().year;
  int month = DateTime.now().month;
  int day = DateTime.now().day;

  @override
  void initState() {
    final now = DateTime.now();
    state = state.copyWith(year: now.year, month: now.month, day: now.day);
    super.initState();
  }

  /// 前の日を選択する
  void selectPreviousDay() {
    final dateTime = DateTime(state.year, state.month, state.day - 1);
    state = state.copyWith(year: dateTime.year, month: dateTime.month, day: dateTime.day);
  }

  /// 次の日を選択する
  void selectNextDay() {
    final dateTime = DateTime(state.year, state.month, state.day + 1);
    state = state.copyWith(year: dateTime.year, month: dateTime.month, day: dateTime.day);
  }
}
