// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ExpenseCategory _$$_ExpenseCategoryFromJson(Map<String, dynamic> json) =>
    _$_ExpenseCategory(
      expenseCategoryId: json['expenseCategoryId'] as String? ?? '',
      name: json['name'] as String? ?? '',
      budget: json['budget'] as int? ?? 0,
      order: json['order'] as int? ?? 0,
      iconName: json['iconName'] as String? ?? '',
      createdAt: json['createdAt'] == null
          ? const UnionTimestamp.serverTimestamp()
          : alwaysUseServerTimestampUnionTimestampConverter
              .fromJson(json['createdAt'] as Object),
      updatedAt: json['updatedAt'] == null
          ? const UnionTimestamp.serverTimestamp()
          : alwaysUseServerTimestampUnionTimestampConverter
              .fromJson(json['updatedAt'] as Object),
      isDelete: json['isDelete'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ExpenseCategoryToJson(_$_ExpenseCategory instance) =>
    <String, dynamic>{
      'expenseCategoryId': instance.expenseCategoryId,
      'name': instance.name,
      'budget': instance.budget,
      'order': instance.order,
      'iconName': instance.iconName,
      'createdAt': alwaysUseServerTimestampUnionTimestampConverter
          .toJson(instance.createdAt),
      'updatedAt': alwaysUseServerTimestampUnionTimestampConverter
          .toJson(instance.updatedAt),
      'isDelete': instance.isDelete,
    };
