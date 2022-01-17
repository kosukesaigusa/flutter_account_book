// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Income _$_$_IncomeFromJson(Map<String, dynamic> json) {
  return _$_Income(
    reference: const DocumentReferenceNullableConverter()
        .fromJson(json['reference'] as DocumentReference<Object?>?),
    earnedAt:
        const TimestampConverter().fromJson(json['earnedAt'] as Timestamp?),
    createdAt:
        const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
    updatedAt:
        const TimestampConverter().fromJson(json['updatedAt'] as Timestamp?),
    isDeleted: json['isDeleted'] as bool? ?? false,
    name: json['name'] as String,
    price: json['price'] as int,
    satisfaction: json['satisfaction'] as int? ?? 3,
    categoryRef: const DocumentReferenceConverter()
        .fromJson(json['categoryRef'] as DocumentReference<Object?>),
  );
}

Map<String, dynamic> _$_$_IncomeToJson(_$_Income instance) => <String, dynamic>{
      'reference':
          const DocumentReferenceNullableConverter().toJson(instance.reference),
      'earnedAt': const TimestampConverter().toJson(instance.earnedAt),
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'isDeleted': instance.isDeleted,
      'name': instance.name,
      'price': instance.price,
      'satisfaction': instance.satisfaction,
      'categoryRef':
          const DocumentReferenceConverter().toJson(instance.categoryRef),
    };
