// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Expense _$$_ExpenseFromJson(Map<String, dynamic> json) => _$_Expense(
      expenseId: json['expenseId'] as String? ?? '',
      name: json['name'] as String? ?? '',
      price: json['price'] as int? ?? 0,
      expenseCategoryId: json['expenseCategoryId'] as String? ?? '',
      paidAt: json['paidAt'] == null
          ? const UnionTimestamp.serverTimestamp()
          : alwaysUseServerTimestampUnionTimestampConverter
              .fromJson(json['paidAt'] as Object),
      createdAt: json['createdAt'] == null
          ? const UnionTimestamp.serverTimestamp()
          : alwaysUseServerTimestampUnionTimestampConverter
              .fromJson(json['createdAt'] as Object),
      updatedAt: json['updatedAt'] == null
          ? const UnionTimestamp.serverTimestamp()
          : alwaysUseServerTimestampUnionTimestampConverter
              .fromJson(json['updatedAt'] as Object),
      isDeleted: json['isDeleted'] as bool? ?? false,
      isForBusiness: json['isForBusiness'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ExpenseToJson(_$_Expense instance) =>
    <String, dynamic>{
      'expenseId': instance.expenseId,
      'name': instance.name,
      'price': instance.price,
      'expenseCategoryId': instance.expenseCategoryId,
      'paidAt': alwaysUseServerTimestampUnionTimestampConverter
          .toJson(instance.paidAt),
      'createdAt': alwaysUseServerTimestampUnionTimestampConverter
          .toJson(instance.createdAt),
      'updatedAt': alwaysUseServerTimestampUnionTimestampConverter
          .toJson(instance.updatedAt),
      'isDeleted': instance.isDeleted,
      'isForBusiness': instance.isForBusiness,
    };
