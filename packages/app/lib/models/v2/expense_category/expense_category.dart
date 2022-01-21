// ignore_for_file: sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ks_flutter_commons/ks_flutter_commons.dart';

part 'expense_category.g.dart';

/// コレクション・ドキュメントのパスの定義
@Collection<V2ExpenseCategory>('v2ExpenseCategory')
@Collection<ExpenseCategory>('v2ExpenseCategory/*/expenseCategories', name: 'expenseCategories')

/// ドキュメント定義
@JsonSerializable()
class V2ExpenseCategory {}

/// ドキュメント定義
@JsonSerializable()
class ExpenseCategory {
  ExpenseCategory({
    required this.expenseCategoryId,
    this.createdAt,
    this.updatedAt,
    required this.name,
    required this.budget,
    this.isDeleted,
    this.order,
    this.iconName,
  });

  final String expenseCategoryId;
  @AutoTimestampConverter()
  DateTime? createdAt;
  @AutoTimestampConverter()
  DateTime? updatedAt;
  final String name;
  final int budget;
  @DefaultFalseConverter()
  bool? isDeleted;
  @AutoSecondsSinceEpochConverter()
  int? order;
  String? iconName;

  factory ExpenseCategory.fromJson(Map<String, dynamic> json) => _$ExpenseCategoryFromJson(json);

  factory ExpenseCategory.fromDocumentSnapshot(DocumentSnapshot<ExpenseCategory> ds) =>
      ExpenseCategory.fromJson(<String, dynamic>{
        ..._$ExpenseCategoryToJson(ds.data()!),
        'expenseCategoryId': ds.id,
      });
}
