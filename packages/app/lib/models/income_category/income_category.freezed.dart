// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'income_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IncomeCategory _$IncomeCategoryFromJson(Map<String, dynamic> json) {
  return _IncomeCategory.fromJson(json);
}

/// @nodoc
class _$IncomeCategoryTearOff {
  const _$IncomeCategoryTearOff();

  _IncomeCategory call(
      {@DocumentReferenceNullableConverter()
          DocumentReference<Object?>? reference,
      @TimestampConverter()
          DateTime? createdAt,
      @TimestampConverter()
          DateTime? updatedAt,
      bool isDeleted = false,
      required String name,
      int order = 0}) {
    return _IncomeCategory(
      reference: reference,
      createdAt: createdAt,
      updatedAt: updatedAt,
      isDeleted: isDeleted,
      name: name,
      order: order,
    );
  }

  IncomeCategory fromJson(Map<String, Object?> json) {
    return IncomeCategory.fromJson(json);
  }
}

/// @nodoc
const $IncomeCategory = _$IncomeCategoryTearOff();

/// @nodoc
mixin _$IncomeCategory {
  @DocumentReferenceNullableConverter()
  DocumentReference<Object?>? get reference =>
      throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IncomeCategoryCopyWith<IncomeCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncomeCategoryCopyWith<$Res> {
  factory $IncomeCategoryCopyWith(
          IncomeCategory value, $Res Function(IncomeCategory) then) =
      _$IncomeCategoryCopyWithImpl<$Res>;
  $Res call(
      {@DocumentReferenceNullableConverter()
          DocumentReference<Object?>? reference,
      @TimestampConverter()
          DateTime? createdAt,
      @TimestampConverter()
          DateTime? updatedAt,
      bool isDeleted,
      String name,
      int order});
}

/// @nodoc
class _$IncomeCategoryCopyWithImpl<$Res>
    implements $IncomeCategoryCopyWith<$Res> {
  _$IncomeCategoryCopyWithImpl(this._value, this._then);

  final IncomeCategory _value;
  // ignore: unused_field
  final $Res Function(IncomeCategory) _then;

  @override
  $Res call({
    Object? reference = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isDeleted = freezed,
    Object? name = freezed,
    Object? order = freezed,
  }) {
    return _then(_value.copyWith(
      reference: reference == freezed
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isDeleted: isDeleted == freezed
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$IncomeCategoryCopyWith<$Res>
    implements $IncomeCategoryCopyWith<$Res> {
  factory _$IncomeCategoryCopyWith(
          _IncomeCategory value, $Res Function(_IncomeCategory) then) =
      __$IncomeCategoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {@DocumentReferenceNullableConverter()
          DocumentReference<Object?>? reference,
      @TimestampConverter()
          DateTime? createdAt,
      @TimestampConverter()
          DateTime? updatedAt,
      bool isDeleted,
      String name,
      int order});
}

/// @nodoc
class __$IncomeCategoryCopyWithImpl<$Res>
    extends _$IncomeCategoryCopyWithImpl<$Res>
    implements _$IncomeCategoryCopyWith<$Res> {
  __$IncomeCategoryCopyWithImpl(
      _IncomeCategory _value, $Res Function(_IncomeCategory) _then)
      : super(_value, (v) => _then(v as _IncomeCategory));

  @override
  _IncomeCategory get _value => super._value as _IncomeCategory;

  @override
  $Res call({
    Object? reference = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isDeleted = freezed,
    Object? name = freezed,
    Object? order = freezed,
  }) {
    return _then(_IncomeCategory(
      reference: reference == freezed
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isDeleted: isDeleted == freezed
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_IncomeCategory implements _IncomeCategory {
  const _$_IncomeCategory(
      {@DocumentReferenceNullableConverter() this.reference,
      @TimestampConverter() this.createdAt,
      @TimestampConverter() this.updatedAt,
      this.isDeleted = false,
      required this.name,
      this.order = 0});

  factory _$_IncomeCategory.fromJson(Map<String, dynamic> json) =>
      _$$_IncomeCategoryFromJson(json);

  @override
  @DocumentReferenceNullableConverter()
  final DocumentReference<Object?>? reference;
  @override
  @TimestampConverter()
  final DateTime? createdAt;
  @override
  @TimestampConverter()
  final DateTime? updatedAt;
  @JsonKey()
  @override
  final bool isDeleted;
  @override
  final String name;
  @JsonKey()
  @override
  final int order;

  @override
  String toString() {
    return 'IncomeCategory(reference: $reference, createdAt: $createdAt, updatedAt: $updatedAt, isDeleted: $isDeleted, name: $name, order: $order)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IncomeCategory &&
            const DeepCollectionEquality().equals(other.reference, reference) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.isDeleted, isDeleted) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.order, order));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(reference),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(isDeleted),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(order));

  @JsonKey(ignore: true)
  @override
  _$IncomeCategoryCopyWith<_IncomeCategory> get copyWith =>
      __$IncomeCategoryCopyWithImpl<_IncomeCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IncomeCategoryToJson(this);
  }
}

abstract class _IncomeCategory implements IncomeCategory {
  const factory _IncomeCategory(
      {@DocumentReferenceNullableConverter()
          DocumentReference<Object?>? reference,
      @TimestampConverter()
          DateTime? createdAt,
      @TimestampConverter()
          DateTime? updatedAt,
      bool isDeleted,
      required String name,
      int order}) = _$_IncomeCategory;

  factory _IncomeCategory.fromJson(Map<String, dynamic> json) =
      _$_IncomeCategory.fromJson;

  @override
  @DocumentReferenceNullableConverter()
  DocumentReference<Object?>? get reference;
  @override
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  @TimestampConverter()
  DateTime? get updatedAt;
  @override
  bool get isDeleted;
  @override
  String get name;
  @override
  int get order;
  @override
  @JsonKey(ignore: true)
  _$IncomeCategoryCopyWith<_IncomeCategory> get copyWith =>
      throw _privateConstructorUsedError;
}
