// ignore_for_file: sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ks_flutter_commons/ks_flutter_commons.dart';

part 'income.g.dart';

/// コレクション・ドキュメントのパスの定義
@Collection<V2Income>('v2Income')
@Collection<Income>('v2Income/*/incomes', name: 'incomes')

/// ドキュメント定義
@JsonSerializable()
class V2Income {}

/// ドキュメント定義
@JsonSerializable()
class Income {
  Income({
    required this.incomeId,
    required this.name,
    required this.price,
    required this.incomeCategoryId,
    this.earnedAt,
    this.createdAt,
    this.updatedAt,
    this.isDeleted,
  });

  final String incomeId;
  final String name;
  final int price;
  final String incomeCategoryId;
  @AutoDateTimeIso8601StringConverter()
  String? earnedAt;
  @AutoTimestampConverter()
  DateTime? createdAt;
  @AutoTimestampConverter()
  DateTime? updatedAt;
  @DefaultFalseConverter()
  bool? isDeleted;

  factory Income.fromJson(Map<String, dynamic> json) => _$IncomeFromJson(json);

  factory Income.fromDocumentSnapshot(DocumentSnapshot<Income> ds) =>
      Income.fromJson(<String, dynamic>{
        ..._$IncomeToJson(ds.data()!),
        'incomeId': ds.id,
      });
}
