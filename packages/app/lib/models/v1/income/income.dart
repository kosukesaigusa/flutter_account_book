import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_account_book/models/v1/json_converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'income.freezed.dart';
part 'income.g.dart';

@freezed
class Income with _$Income {
  const factory Income({
    @DocumentReferenceNullableConverter() DocumentReference? reference,
    @TimestampConverter() DateTime? earnedAt,
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? updatedAt,
    @Default(false) bool isDeleted,
    required String name,
    required int price,
    @Default(3) int satisfaction,
    @DocumentReferenceConverter() required DocumentReference categoryRef,
  }) = _Income;

  factory Income.fromJson(Map<String, dynamic> json) => _$IncomeFromJson(json);

  factory Income.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    final data = documentSnapshot.data()! as Map<String, dynamic>;
    return Income.fromJson(<String, dynamic>{
      ...data,
      'reference': documentSnapshot.reference,
    });
  }
}
