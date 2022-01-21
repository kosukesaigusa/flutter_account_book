import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_account_book/controllers/category_add/category_add_page_state.dart';
import 'package:flutter_account_book/controllers/snack_bar/snack_bar_controller.dart';
import 'package:flutter_account_book/models/v2/expense_category/expense_category.dart';
import 'package:flutter_account_book/repository/auth/auth_repository.dart';
import 'package:flutter_account_book/repository/expense_category/expense_category_repository.dart';
import 'package:flutter_account_book/utils/utils.dart';
import 'package:state_notifier/state_notifier.dart';

class CategoryAddPageController extends StateNotifier<CategoryAddPageState> with LocatorMixin {
  CategoryAddPageController() : super(const CategoryAddPageState());

  SnackBarController get snackBarController => read();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController budgetTextEditingController = TextEditingController();

  @override
  void initState() {
    print('');
    super.initState();
  }

  /// 支出カテゴリーを登録する。
  Future<bool> setExpenseCategory() async {
    if (nameTextEditingController.value.text.isEmpty) {
      return false;
    }
    if (budgetTextEditingController.value.text.isEmpty) {
      return false;
    }
    if (state.sending) {
      return false;
    }
    state = state.copyWith(sending: true);
    try {
      final budget = int.parse(budgetTextEditingController.value.text);
      if (!(budget > 0)) {
        snackBarController.show('予算は 0 以上の整数値で入力してください。');
        return false;
      }
      final expenseCategory = ExpenseCategory(
        expenseCategoryId: uuid,
        name: nameTextEditingController.value.text,
        budget: budget,
      );
      await ExpenseCategoryRepository.expenseCategoryRef(
        userId: AuthRepository.uid,
        expenseCategoryId: expenseCategory.expenseCategoryId,
      ).set(expenseCategory);
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
}
