import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../firestore/models/expense.dart';
import '../firestore/models/expense_category.dart';
import '../firestore/repositories/expense_category_repository.dart';
import '../firestore/repositories/expense_repository.dart';
import '../scaffold_messenger_controller.dart';
import '../union_timestamp.dart';
import 'expense_form.dart';

final originalExpenseStateProvider = StateProvider<Expense?>((_) => null);

final expenseFormStateNotifierProvider =
    StateNotifierProvider.autoDispose<ExpenseFormStateNotifier, ExpenseForm>(
  (ref) => ExpenseFormStateNotifier(
    ref: ref,
    originalExpense: ref.watch(originalExpenseStateProvider),
  ),
);

class ExpenseFormStateNotifier extends StateNotifier<ExpenseForm> {
  ExpenseFormStateNotifier({
    required StateNotifierProviderRef<ExpenseFormStateNotifier, ExpenseForm>
        ref,
    Expense? originalExpense,
  })  : _ref = ref,
        _originalExpense = originalExpense,
        super(const ExpenseForm()) {
    final now = DateTime.now();
    state = state.copyWith(year: now.year, month: now.month, day: now.day);
    _init();
  }

  final StateNotifierProviderRef<ExpenseFormStateNotifier, ExpenseForm> _ref;

  final Expense? _originalExpense;

  final nameTextEditingController = TextEditingController();

  final priceTextEditingController = TextEditingController();

  /// 初期化する。
  Future<void> _init() async {
    if (_originalExpense != null) {
      await _initWithInstance(_originalExpense!);
    }
    await fetchExpenseCategories();
    state = state.copyWith(loading: false);
  }

  /// 既存の Expense の編集の際のイニシャライズ処理を行う。
  Future<void> _initWithInstance(Expense expense) async {
    nameTextEditingController.text = expense.name;
    priceTextEditingController.text = expense.price.toString();
    final dateTime = expense.paidAt.dateTime ?? DateTime.now();
    state = state.copyWith(
      year: dateTime.year,
      month: dateTime.month,
      day: dateTime.day,
      name: expense.name,
      price: expense.price,
      selectedExpenseCategory: await _ref
          .read(expenseCategoryRepositoryProvider)
          .fetchExpenseCategory(expenseCategoryId: expense.expenseCategoryId),
    );
  }

  /// 支払いカテゴリーを取得する。
  /// ついでに最初のカテゴリーを選択状態にする。
  Future<void> fetchExpenseCategories() async {
    state = state.copyWith(loading: true);
    final expenseCategories = await _ref
        .read(expenseCategoryRepositoryProvider)
        .fetchExpenseCategories();
    state = state.copyWith(
      expenseCategories: expenseCategories,
      selectedExpenseCategory:
          expenseCategories.isEmpty ? null : expenseCategories.first,
    );
  }

  /// 支出を登録する。
  Future<bool> addExpense() async {
    if (state.sending) {
      return false;
    }
    final expenseCategory = state.selectedExpenseCategory;
    if (expenseCategory == null) {
      _ref
          .read(mainScaffoldMessengerControllerProvider)
          .showSnackBar('カテゴリーを選択してください。');
      return false;
    }
    state = state.copyWith(sending: true);
    try {
      final price = int.parse(priceTextEditingController.value.text);
      if (!(price > 0)) {
        _ref
            .read(mainScaffoldMessengerControllerProvider)
            .showSnackBar('金額は 0 以上の整数値で入力してください。。');
        return false;
      }
      final expense = Expense(
        name: nameTextEditingController.value.text,
        price: int.parse(priceTextEditingController.value.text),
        expenseCategoryId: expenseCategory.expenseCategoryId,
        paidAt: UnionTimestamp.dateTime(
          DateTime(state.year, state.month, state.day),
        ),
      );
      if (_originalExpense == null) {
        await _ref.read(expenseRepositoryProvider).addExpense(expense: expense);
      } else {}
      await _ref.read(expenseRepositoryProvider).addExpense(expense: expense);
    } on FirebaseException catch (e) {
      _ref
          .read(mainScaffoldMessengerControllerProvider)
          .showSnackBarByFirebaseException(e);
      return false;
    } on Exception catch (e) {
      _ref
          .read(mainScaffoldMessengerControllerProvider)
          .showSnackBarByException(e);
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
    if (_originalExpense == null) {
      _ref
          .read(mainScaffoldMessengerControllerProvider)
          .showSnackBar('もとの支出データが見つかりませんでした。');
      return false;
    }
    final expenseCategory = state.selectedExpenseCategory;
    if (expenseCategory == null) {
      _ref
          .read(mainScaffoldMessengerControllerProvider)
          .showSnackBar('カテゴリーを選択してください。');
      return false;
    }
    state = state.copyWith(sending: true);
    try {
      final price = int.parse(priceTextEditingController.value.text);
      if (!(price > 0)) {
        _ref
            .read(mainScaffoldMessengerControllerProvider)
            .showSnackBar('金額は 0 以上の整数値で入力してください。');
        return false;
      }
      await _ref.read(expenseRepositoryProvider).updateExpense(
            expenseId: _originalExpense!.expenseId,
            name: nameTextEditingController.value.text,
            price: int.parse(priceTextEditingController.value.text),
            expenseCategoryId: expenseCategory.expenseCategoryId,
            paidAt: DateTime(state.year, state.month, state.day),
          );
    } on FirebaseException catch (e) {
      _ref
          .read(mainScaffoldMessengerControllerProvider)
          .showSnackBarByFirebaseException(e);
      return false;
    } on Exception catch (e) {
      _ref
          .read(mainScaffoldMessengerControllerProvider)
          .showSnackBarByException(e);
      return false;
    } finally {
      state = state.copyWith(sending: false);
    }
    return true;
  }

  /// 支出を削除する
  Future<bool> deleteExpense(String expenseId) async {
    try {
      await _ref
          .read(expenseRepositoryProvider)
          .deleteExpense(expenseId: expenseId);
    } on FirebaseException catch (e) {
      _ref
          .read(mainScaffoldMessengerControllerProvider)
          .showSnackBarByFirebaseException(e);
      return false;
    } on Exception catch (e) {
      _ref
          .read(mainScaffoldMessengerControllerProvider)
          .showSnackBarByException(e);
      return false;
    } finally {
      state = state.copyWith(sending: false);
    }
    return true;
  }

  /// 支払い方法を選択する。
  void selectExpenseCategory(ExpenseCategory expenseCategory) {
    state = state.copyWith(selectedExpenseCategory: expenseCategory);
  }

  /// 前の日を選択する。
  void selectPreviousDay() {
    final dateTime = DateTime(state.year, state.month, state.day - 1);
    state = state.copyWith(
      year: dateTime.year,
      month: dateTime.month,
      day: dateTime.day,
    );
  }

  /// 次の日を選択する。
  void selectNextDay() {
    final dateTime = DateTime(state.year, state.month, state.day + 1);
    state = state.copyWith(
      year: dateTime.year,
      month: dateTime.month,
      day: dateTime.day,
    );
  }
}
