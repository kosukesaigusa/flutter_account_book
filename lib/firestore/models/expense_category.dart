import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../union_timestamp.dart';

part 'expense_category.freezed.dart';
part 'expense_category.g.dart';

@freezed
class ExpenseCategory with _$ExpenseCategory {
  const factory ExpenseCategory({
    @Default('') String expenseCategoryId,
    @Default('') String name,
    @Default(0) int budget,
    @Default(0) int order,
    // TODO: コンバータを定義して Icon の Enum を指定するのが良さそう。
    @Default('') String iconName,
    @alwaysUseServerTimestampUnionTimestampConverter
    @Default(UnionTimestamp.serverTimestamp())
        UnionTimestamp createdAt,
    @alwaysUseServerTimestampUnionTimestampConverter
    @Default(UnionTimestamp.serverTimestamp())
        UnionTimestamp updatedAt,
    @Default(false) bool isDelete,
  }) = _ExpenseCategory;

  factory ExpenseCategory.fromJson(Map<String, dynamic> json) =>
      _$ExpenseCategoryFromJson(json);

  factory ExpenseCategory.fromDocumentSnapshot(DocumentSnapshot ds) {
    final data = ds.data()! as Map<String, dynamic>;
    return ExpenseCategory.fromJson(<String, dynamic>{
      ...data,
      'expenseCategoryId': ds.id,
    });
  }

  const ExpenseCategory._();
}
