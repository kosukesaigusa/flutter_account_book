import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_account_book/models/v1/json_converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense.freezed.dart';
part 'expense.g.dart';

@freezed
class Expense with _$Expense {
  const factory Expense({
    @DocumentReferenceNullableConverter() DocumentReference? reference,
    @TimestampConverter() DateTime? paidAt,
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? updatedAt,
    @Default(false) bool isDeleted,
    required String name,
    required int price,
    @Default(3) int satisfaction,
    @DocumentReferenceConverter() required DocumentReference expenseCategoryRef,
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
