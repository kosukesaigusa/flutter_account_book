// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_IncomeCategory _$$_IncomeCategoryFromJson(Map<String, dynamic> json) =>
    _$_IncomeCategory(
      reference: const DocumentReferenceNullableConverter()
          .fromJson(json['reference'] as DocumentReference<Object?>?),
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp?),
      isDeleted: json['isDeleted'] as bool? ?? false,
      name: json['name'] as String,
      order: json['order'] as int? ?? 0,
    );

Map<String, dynamic> _$$_IncomeCategoryToJson(_$_IncomeCategory instance) =>
    <String, dynamic>{
      'reference':
          const DocumentReferenceNullableConverter().toJson(instance.reference),
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'isDeleted': instance.isDeleted,
      'name': instance.name,
      'order': instance.order,
    };
