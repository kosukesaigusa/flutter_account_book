// ignore_for_file: sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ks_flutter_commons/ks_flutter_commons.dart';

part 'expense.g.dart';

/// コレクション・ドキュメントのパスの定義
@Collection<V2Expense>('v2Expense')
@Collection<Expense>('v2Expense/*/expenses', name: 'expenses')

/// ドキュメント定義
@JsonSerializable()
class V2Expense {}

/// ドキュメント定義
@JsonSerializable()
class Expense {
  Expense({
    required this.expenseId,
    required this.name,
    required this.price,
    required this.expenseCategoryId,
    this.paidAt,
    this.createdAt,
    this.updatedAt,
    this.isDeleted,
    this.satisfaction,
  });

  final String expenseId;
  final String name;
  final int price;
  final String expenseCategoryId;
  @AutoTimestampIso8601StringConverter()
  String? paidAt;
  @AutoTimestampIso8601StringConverter()
  String? createdAt;
  @AutoTimestampIso8601StringConverter()
  String? updatedAt;
  @JsonKey(defaultValue: false)
  bool? isDeleted;
  @JsonKey(defaultValue: 3)
  int? satisfaction;

  factory Expense.fromJson(Map<String, dynamic> json) => _$ExpenseFromJson(json);

  factory Expense.fromDocumentSnapshot(DocumentSnapshot<Expense> ds) =>
      Expense.fromJson(<String, dynamic>{
        ..._$ExpenseToJson(ds.data()!),
        'expenseId': ds.id,
      });
}
