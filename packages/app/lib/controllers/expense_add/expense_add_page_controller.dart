import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_account_book/controllers/expense_add/expense_add_page_state.dart';
import 'package:flutter_account_book/controllers/snack_bar/snack_bar_controller.dart';
import 'package:flutter_account_book/models/v2/expense/expense.dart';
import 'package:flutter_account_book/models/v2/expense_category/expense_category.dart';
import 'package:flutter_account_book/repository/auth/auth_repository.dart';
import 'package:flutter_account_book/repository/expense/expense_repository.dart';
import 'package:flutter_account_book/repository/expense_category/expense_category_repository.dart';
import 'package:flutter_account_book/utils/utility_methods.dart';
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
    super.initState();
    final now = DateTime.now();
    state = state.copyWith(year: now.year, month: now.month, day: now.day);
    fetchExpenseCategories();
  }

  /// 支払いカテゴリーを取得する。
  /// ついでに最初のカテゴリーを選択状態にする。
  Future<void> fetchExpenseCategories() async {
    state = state.copyWith(loading: true);
    final expenseCategories = await ExpenseCategoryRepository.fetchExpenseCategories(
      userId: AuthRepository.nonNullUser.uid,
      queryBuilder: (q) => q.orderByOrder(),
    );
    state = state.copyWith(
      expenseCategories: expenseCategories,
      selectedExpenseCategory: expenseCategories.isEmpty ? null : expenseCategories.first,
      loading: false,
    );
  }

  /// 支出を登録する。
  Future<bool> setExpense() async {
    final expenseCategory = state.selectedExpenseCategory;
    if (state.sending) {
      return false;
    }
    if (expenseCategory == null) {
      snackBarController.showMessage('支払い方法を選択してください。');
      return false;
    }
    state = state.copyWith(sending: true);
    try {
      final price = int.parse(priceTextEditingController.value.text);
      if (!(price > 0)) {
        snackBarController.show('金額は整数値で入力してください。');
        return false;
      }
      final expense = Expense(
        expenseId: uuid,
        name: nameTextEditingController.value.text,
        price: int.parse(priceTextEditingController.value.text),
        expenseCategoryId: expenseCategory.expenseCategoryId,
      );
      await ExpenseRepository.expenseRef(
        userId: AuthRepository.nonNullUser.uid,
        expenseId: expense.expenseId,
      ).set(expense);
    } on FirebaseException catch (e) {
      snackBarController.showByFirebaseException(e);
      return false;
    } on Exception catch (e) {
      snackBarController.showByException(e);
      return false;
    } finally {
      state = state.copyWith(sending: false);
    }
    return true;
  }

  /// 支払い方法を選択する。
  void selectExpenseCategory(ExpenseCategory c) {
    state = state.copyWith(selectedExpenseCategory: c);
  }

  /// 前の日を選択する。
  void selectPreviousDay() {
    final dateTime = DateTime(state.year, state.month, state.day - 1);
    state = state.copyWith(year: dateTime.year, month: dateTime.month, day: dateTime.day);
  }

  /// 次の日を選択する。
  void selectNextDay() {
    final dateTime = DateTime(state.year, state.month, state.day + 1);
    state = state.copyWith(year: dateTime.year, month: dateTime.month, day: dateTime.day);
  }
}
