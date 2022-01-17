// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ExpenseCategory _$$_ExpenseCategoryFromJson(Map<String, dynamic> json) =>
    _$_ExpenseCategory(
      reference: const DocumentReferenceNullableConverter()
          .fromJson(json['reference'] as DocumentReference<Object?>?),
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp?),
      isDeleted: json['isDeleted'] as bool? ?? false,
      name: json['name'] as String,
      budget: json['budget'] as int,
      order: json['order'] as int? ?? 0,
    );

Map<String, dynamic> _$$_ExpenseCategoryToJson(_$_ExpenseCategory instance) =>
    <String, dynamic>{
      'reference':
          const DocumentReferenceNullableConverter().toJson(instance.reference),
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'isDeleted': instance.isDeleted,
      'name': instance.name,
      'budget': instance.budget,
      'order': instance.order,
    };
