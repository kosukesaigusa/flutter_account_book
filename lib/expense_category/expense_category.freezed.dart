// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ExpenseCategory _$ExpenseCategoryFromJson(Map<String, dynamic> json) {
  return _ExpenseCategory.fromJson(json);
}

/// @nodoc
mixin _$ExpenseCategory {
  String get expenseCategoryId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get budget => throw _privateConstructorUsedError;
  int get order =>
      throw _privateConstructorUsedError; // TODO: コンバータを定義して Icon の Enum を指定するのが良さそう。
  String get iconName => throw _privateConstructorUsedError;
  @alwaysUseServerTimestampUnionTimestampConverter
  UnionTimestamp get createdAt => throw _privateConstructorUsedError;
  @alwaysUseServerTimestampUnionTimestampConverter
  UnionTimestamp get updatedAt => throw _privateConstructorUsedError;
  bool get isDelete => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExpenseCategoryCopyWith<ExpenseCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseCategoryCopyWith<$Res> {
  factory $ExpenseCategoryCopyWith(
          ExpenseCategory value, $Res Function(ExpenseCategory) then) =
      _$ExpenseCategoryCopyWithImpl<$Res, ExpenseCategory>;
  @useResult
  $Res call(
      {String expenseCategoryId,
      String name,
      int budget,
      int order,
      String iconName,
      @alwaysUseServerTimestampUnionTimestampConverter UnionTimestamp createdAt,
      @alwaysUseServerTimestampUnionTimestampConverter UnionTimestamp updatedAt,
      bool isDelete});

  $UnionTimestampCopyWith<$Res> get createdAt;
  $UnionTimestampCopyWith<$Res> get updatedAt;
}

/// @nodoc
class _$ExpenseCategoryCopyWithImpl<$Res, $Val extends ExpenseCategory>
    implements $ExpenseCategoryCopyWith<$Res> {
  _$ExpenseCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expenseCategoryId = null,
    Object? name = null,
    Object? budget = null,
    Object? order = null,
    Object? iconName = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isDelete = null,
  }) {
    return _then(_value.copyWith(
      expenseCategoryId: null == expenseCategoryId
          ? _value.expenseCategoryId
          : expenseCategoryId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      budget: null == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as int,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      iconName: null == iconName
          ? _value.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as UnionTimestamp,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as UnionTimestamp,
      isDelete: null == isDelete
          ? _value.isDelete
          : isDelete // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UnionTimestampCopyWith<$Res> get createdAt {
    return $UnionTimestampCopyWith<$Res>(_value.createdAt, (value) {
      return _then(_value.copyWith(createdAt: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UnionTimestampCopyWith<$Res> get updatedAt {
    return $UnionTimestampCopyWith<$Res>(_value.updatedAt, (value) {
      return _then(_value.copyWith(updatedAt: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ExpenseCategoryCopyWith<$Res>
    implements $ExpenseCategoryCopyWith<$Res> {
  factory _$$_ExpenseCategoryCopyWith(
          _$_ExpenseCategory value, $Res Function(_$_ExpenseCategory) then) =
      __$$_ExpenseCategoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String expenseCategoryId,
      String name,
      int budget,
      int order,
      String iconName,
      @alwaysUseServerTimestampUnionTimestampConverter UnionTimestamp createdAt,
      @alwaysUseServerTimestampUnionTimestampConverter UnionTimestamp updatedAt,
      bool isDelete});

  @override
  $UnionTimestampCopyWith<$Res> get createdAt;
  @override
  $UnionTimestampCopyWith<$Res> get updatedAt;
}

/// @nodoc
class __$$_ExpenseCategoryCopyWithImpl<$Res>
    extends _$ExpenseCategoryCopyWithImpl<$Res, _$_ExpenseCategory>
    implements _$$_ExpenseCategoryCopyWith<$Res> {
  __$$_ExpenseCategoryCopyWithImpl(
      _$_ExpenseCategory _value, $Res Function(_$_ExpenseCategory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expenseCategoryId = null,
    Object? name = null,
    Object? budget = null,
    Object? order = null,
    Object? iconName = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isDelete = null,
  }) {
    return _then(_$_ExpenseCategory(
      expenseCategoryId: null == expenseCategoryId
          ? _value.expenseCategoryId
          : expenseCategoryId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      budget: null == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as int,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      iconName: null == iconName
          ? _value.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as UnionTimestamp,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as UnionTimestamp,
      isDelete: null == isDelete
          ? _value.isDelete
          : isDelete // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ExpenseCategory extends _ExpenseCategory {
  const _$_ExpenseCategory(
      {this.expenseCategoryId = '',
      this.name = '',
      this.budget = 0,
      this.order = 0,
      this.iconName = '',
      @alwaysUseServerTimestampUnionTimestampConverter
          this.createdAt = const UnionTimestamp.serverTimestamp(),
      @alwaysUseServerTimestampUnionTimestampConverter
          this.updatedAt = const UnionTimestamp.serverTimestamp(),
      this.isDelete = false})
      : super._();

  factory _$_ExpenseCategory.fromJson(Map<String, dynamic> json) =>
      _$$_ExpenseCategoryFromJson(json);

  @override
  @JsonKey()
  final String expenseCategoryId;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final int budget;
  @override
  @JsonKey()
  final int order;
// TODO: コンバータを定義して Icon の Enum を指定するのが良さそう。
  @override
  @JsonKey()
  final String iconName;
  @override
  @JsonKey()
  @alwaysUseServerTimestampUnionTimestampConverter
  final UnionTimestamp createdAt;
  @override
  @JsonKey()
  @alwaysUseServerTimestampUnionTimestampConverter
  final UnionTimestamp updatedAt;
  @override
  @JsonKey()
  final bool isDelete;

  @override
  String toString() {
    return 'ExpenseCategory(expenseCategoryId: $expenseCategoryId, name: $name, budget: $budget, order: $order, iconName: $iconName, createdAt: $createdAt, updatedAt: $updatedAt, isDelete: $isDelete)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExpenseCategory &&
            (identical(other.expenseCategoryId, expenseCategoryId) ||
                other.expenseCategoryId == expenseCategoryId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.budget, budget) || other.budget == budget) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.iconName, iconName) ||
                other.iconName == iconName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isDelete, isDelete) ||
                other.isDelete == isDelete));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, expenseCategoryId, name, budget,
      order, iconName, createdAt, updatedAt, isDelete);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExpenseCategoryCopyWith<_$_ExpenseCategory> get copyWith =>
      __$$_ExpenseCategoryCopyWithImpl<_$_ExpenseCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExpenseCategoryToJson(
      this,
    );
  }
}

abstract class _ExpenseCategory extends ExpenseCategory {
  const factory _ExpenseCategory(
      {final String expenseCategoryId,
      final String name,
      final int budget,
      final int order,
      final String iconName,
      @alwaysUseServerTimestampUnionTimestampConverter
          final UnionTimestamp createdAt,
      @alwaysUseServerTimestampUnionTimestampConverter
          final UnionTimestamp updatedAt,
      final bool isDelete}) = _$_ExpenseCategory;
  const _ExpenseCategory._() : super._();

  factory _ExpenseCategory.fromJson(Map<String, dynamic> json) =
      _$_ExpenseCategory.fromJson;

  @override
  String get expenseCategoryId;
  @override
  String get name;
  @override
  int get budget;
  @override
  int get order;
  @override // TODO: コンバータを定義して Icon の Enum を指定するのが良さそう。
  String get iconName;
  @override
  @alwaysUseServerTimestampUnionTimestampConverter
  UnionTimestamp get createdAt;
  @override
  @alwaysUseServerTimestampUnionTimestampConverter
  UnionTimestamp get updatedAt;
  @override
  bool get isDelete;
  @override
  @JsonKey(ignore: true)
  _$$_ExpenseCategoryCopyWith<_$_ExpenseCategory> get copyWith =>
      throw _privateConstructorUsedError;
}
