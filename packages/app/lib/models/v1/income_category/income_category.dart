import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_account_book/models/v1/json_converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'income_category.freezed.dart';
part 'income_category.g.dart';

@freezed
class IncomeCategory with _$IncomeCategory {
  const factory IncomeCategory({
    @DocumentReferenceNullableConverter() DocumentReference? reference,
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? updatedAt,
    @Default(false) bool isDeleted,
    required String name,
    @Default(0) int order,
  }) = _IncomeCategory;

  factory IncomeCategory.fromJson(Map<String, dynamic> json) => _$IncomeCategoryFromJson(json);

  factory IncomeCategory.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    final data = documentSnapshot.data()! as Map<String, dynamic>;
    return IncomeCategory.fromJson(<String, dynamic>{
      ...data,
      'reference': documentSnapshot.reference,
    });
  }
}
