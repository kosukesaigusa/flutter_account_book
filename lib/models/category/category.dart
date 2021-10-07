import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_account_book/models/json_converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class Category with _$Category {
  const factory Category({
    @DocumentReferenceNullableConverter() DocumentReference? reference,
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? updatedAt,
    @Default(false) bool isDeleted,
    required String name,
    @DocumentReferenceConverter() required DocumentReference requiredReference,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  factory Category.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    final data = documentSnapshot.data()! as Map<String, dynamic>;
    return Category.fromJson(<String, dynamic>{
      ...data,
      'reference': documentSnapshot.reference,
    });
  }
}
