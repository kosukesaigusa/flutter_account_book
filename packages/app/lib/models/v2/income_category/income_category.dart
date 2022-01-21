// ignore_for_file: sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ks_flutter_commons/ks_flutter_commons.dart';

part 'income_category.g.dart';

/// コレクション・ドキュメントのパスの定義
@Collection<V2IncomeCategory>('v2IncomeCategory')
@Collection<IncomeCategory>('v2IncomeCategory/*/incomeCategories', name: 'incomeCategories')

/// ドキュメント定義
@JsonSerializable()
class V2IncomeCategory {}

/// ドキュメント定義
@JsonSerializable()
class IncomeCategory {
  IncomeCategory({
    required this.incomeCategoryId,
    this.createdAt,
    this.updatedAt,
    required this.name,
    required this.budget,
    this.isDeleted,
    this.order,
    this.iconName,
  });

  final String incomeCategoryId;
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

  factory IncomeCategory.fromJson(Map<String, dynamic> json) => _$IncomeCategoryFromJson(json);

  factory IncomeCategory.fromDocumentSnapshot(DocumentSnapshot<IncomeCategory> ds) =>
      IncomeCategory.fromJson(<String, dynamic>{
        ..._$IncomeCategoryToJson(ds.data()!),
        'incomeCategoryId': ds.id,
      });
}
