// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Expense _$_$_ExpenseFromJson(Map<String, dynamic> json) {
  return _$_Expense(
    reference: const DocumentReferenceNullableConverter()
        .fromJson(json['reference'] as DocumentReference<Object?>?),
    createdAt:
        const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
    updatedAt:
        const TimestampConverter().fromJson(json['updatedAt'] as Timestamp?),
    isDeleted: json['isDeleted'] as bool? ?? false,
    name: json['name'] as String,
    price: json['price'] as int,
    categoryRef: const DocumentReferenceConverter()
        .fromJson(json['categoryRef'] as DocumentReference<Object?>),
  );
}

Map<String, dynamic> _$_$_ExpenseToJson(_$_Expense instance) =>
    <String, dynamic>{
      'reference':
          const DocumentReferenceNullableConverter().toJson(instance.reference),
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'isDeleted': instance.isDeleted,
      'name': instance.name,
      'price': instance.price,
      'categoryRef':
          const DocumentReferenceConverter().toJson(instance.categoryRef),
    };
