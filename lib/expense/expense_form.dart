import 'package:freezed_annotation/freezed_annotation.dart';

import '../firestore/models/expense_category.dart';

part 'expense_form.freezed.dart';

@freezed
class ExpenseForm with _$ExpenseForm {
  const factory ExpenseForm({
    @Default(true) bool loading,
    @Default(false) bool sending,
    @Default(1970) int year,
    @Default(1) int month,
    @Default(1) int day,
    String? name,
    int? price,
    @Default(<ExpenseCategory>[]) List<ExpenseCategory> expenseCategories,
    ExpenseCategory? selectedExpenseCategory,
  }) = _ExpenseForm;
}
