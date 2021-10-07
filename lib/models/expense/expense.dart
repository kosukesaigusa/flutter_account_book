import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_account_book/models/json_converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'expense.freezed.dart';
part 'expense.g.dart';

@freezed
class Expense with _$Expense {
  const factory Expense({
    @DocumentReferenceNullableConverter() DocumentReference? reference,
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? updatedAt,
    @Default(false) bool isDeleted,
    required String name,
    required int price,
    @DocumentReferenceConverter() required DocumentReference categoryRef,
    @DocumentReferenceConverter() required DocumentReference requiredReference,
  }) = _Expense;

  factory Expense.fromJson(Map<String, dynamic> json) => _$ExpenseFromJson(json);

  factory Expense.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    final data = documentSnapshot.data()! as Map<String, dynamic>;
    return Expense.fromJson(<String, dynamic>{
      ...data,
      'reference': documentSnapshot.reference,
    });
  }
}
