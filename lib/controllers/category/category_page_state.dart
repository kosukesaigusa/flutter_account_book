import 'package:flutter_account_book/models/v2/expense_category/expense_category.dart';
import 'package:flutter_account_book/models/v2/income_category/income_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_page_state.freezed.dart';

@freezed
class CategoryPageState with _$CategoryPageState {
  const factory CategoryPageState({
    @Default(true) bool loading,
    @Default(<ExpenseCategory>[]) List<ExpenseCategory> expenseCategories,
    @Default(<IncomeCategory>[]) List<IncomeCategory> incomeCategories,
  }) = _CategoryPageState;
}
