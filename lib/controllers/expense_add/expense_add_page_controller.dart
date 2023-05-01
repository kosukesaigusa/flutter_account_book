import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_account_book/controllers/expense_add/expense_add_page_state.dart';
import 'package:flutter_account_book/controllers/snack_bar/snack_bar_controller.dart';
import 'package:flutter_account_book/models/v2/expense/expense.dart';
import 'package:flutter_account_book/models/v2/expense_category/expense_category.dart';
import 'package:flutter_account_book/repository/expense/expense_repository.dart';
import 'package:flutter_account_book/repository/expense_category/expense_category_repository.dart';
import 'package:flutter_account_book/utils/utils.dart';
import 'package:state_notifier/state_notifier.dart';

class ExpenseAddPageController extends StateNotifier<ExpenseAddPageState> with LocatorMixin {
  ExpenseAddPageController({this.originalExpense}) : super(const ExpenseAddPageState());

  final Expense? originalExpense;
  SnackBarController get snackBarController => read();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController priceTextEditingController = TextEditingController();

  @override
  void initState() {
    final now = DateTime.now();
    state = state.copyWith(year: now.year, month: now.month, day: now.day);
    init();
    super.initState();
  }

  Future<void> init() async {
    if (originalExpense != null) {
      await initWithInstance(originalExpense!);
    }
    await fetchExpenseCategories();
    state = state.copyWith(loading: false);
  }

  /// 既存の Expense の編集の際のイニシャライズ処理
  Future<void> initWithInstance(Expense expense) async {
    nameTextEditingController.text = expense.name;
    priceTextEditingController.text = expense.price.toString();
    final dateTime = expense.paidAt == null ? DateTime.now() : DateTime.parse(expense.paidAt!);
    state = state.copyWith(
        year: dateTime.year,
        month: dateTime.month,
        day: dateTime.day,
        name: expense.name,
        price: expense.price,
        selectedExpenseCategory: await ExpenseCategoryRepository.fetchExpenseCategory(
          userId: nonNullUid,
          expenseCategoryId: expense.expenseCategoryId,
        ));
  }

  /// 支払いカテゴリーを取得する。
  /// ついでに最初のカテゴリーを選択状態にする。
  Future<void> fetchExpenseCategories() async {
    state = state.copyWith(loading: true);
    final expenseCategories = await ExpenseCategoryRepository.fetchExpenseCategories(
      userId: nonNullUid,
      queryBuilder: (q) => q.orderByOrder(),
    );
    state = state.copyWith(
      expenseCategories: expenseCategories,
      selectedExpenseCategory: expenseCategories.isEmpty ? null : expenseCategories.first,
    );
  }

  /// 支出を登録する。
  Future<bool> setExpense() async {
    if (state.sending) {
      return false;
    }
    final expenseCategory = state.selectedExpenseCategory;
    if (expenseCategory == null) {
      snackBarController.showMessage('カテゴリーを選択してください。');
      return false;
    }
    state = state.copyWith(sending: true);
    try {
      final price = int.parse(priceTextEditingController.value.text);
      if (!(price > 0)) {
        snackBarController.show('金額は 0 以上の整数値で入力してください。');
        return false;
      }
      final expense = Expense(
        expenseId: uuid,
        name: nameTextEditingController.value.text,
        price: int.parse(priceTextEditingController.value.text),
        expenseCategoryId: expenseCategory.expenseCategoryId,
        paidAt: DateTime(state.year, state.month, state.day).toIso8601String(),
      );
      await ExpenseRepository.expenseRef(
        userId: nonNullUid,
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

  /// 支出を更新する。
  Future<bool> updateExpense() async {
    if (state.sending) {
      return false;
    }
    if (originalExpense == null) {
      snackBarController.showMessage('もとの支出データが見つかりませんでした。');
      return false;
    }
    final expenseCategory = state.selectedExpenseCategory;
    if (expenseCategory == null) {
      snackBarController.showMessage('カテゴリーを選択してください。');
      return false;
    }
    state = state.copyWith(sending: true);
    try {
      final price = int.parse(priceTextEditingController.value.text);
      if (!(price > 0)) {
        snackBarController.show('金額は 0 以上の整数値で入力してください。');
        return false;
      }
      await ExpenseRepository.expenseRef(
        userId: nonNullUid,
        expenseId: originalExpense!.expenseId,
      ).update(
        name: nameTextEditingController.value.text,
        price: int.parse(priceTextEditingController.value.text),
        expenseCategoryId: expenseCategory.expenseCategoryId,
        paidAt: DateTime(state.year, state.month, state.day).toIso8601String(),
        satisfaction: originalExpense != null ? originalExpense!.satisfaction : 3,
      );
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

  /// 支出を削除する
  Future<bool> deleteExpense(Expense e) async {
    try {
      await ExpenseRepository.expenseRef(
        userId: nonNullUid,
        expenseId: e.expenseId,
      ).delete();
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
