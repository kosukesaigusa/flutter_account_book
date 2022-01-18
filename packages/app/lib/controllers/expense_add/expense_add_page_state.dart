import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_add_page_state.freezed.dart';

@freezed
class ExpenseAddPageState with _$ExpenseAddPageState {
  const factory ExpenseAddPageState({
    @Default(true) bool loading,
    @Default(1970) int year,
    @Default(1) int month,
    @Default(1) int day,
    String? name,
    int? price,
  }) = _ExpenseAddPageState;
}
