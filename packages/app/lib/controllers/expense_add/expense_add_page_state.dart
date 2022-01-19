import 'package:flutter_account_book/models/v2/expense_category/expense_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_add_page_state.freezed.dart';

@freezed
class ExpenseAddPageState with _$ExpenseAddPageState {
  const factory ExpenseAddPageState({
    @Default(true) bool loading,
    @Default(false) bool sending,
    @Default(1970) int year,
    @Default(1) int month,
    @Default(1) int day,
    String? name,
    int? price,
    @Default(<ExpenseCategory>[]) List<ExpenseCategory> expenseCategories,
    ExpenseCategory? selectedExpenseCategory,
  }) = _ExpenseAddPageState;
}
