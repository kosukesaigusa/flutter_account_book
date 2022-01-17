// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'income.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Income _$IncomeFromJson(Map<String, dynamic> json) {
  return _Income.fromJson(json);
}

/// @nodoc
class _$IncomeTearOff {
  const _$IncomeTearOff();

  _Income call(
      {@DocumentReferenceNullableConverter()
          DocumentReference<Object?>? reference,
      @TimestampConverter()
          DateTime? earnedAt,
      @TimestampConverter()
          DateTime? createdAt,
      @TimestampConverter()
          DateTime? updatedAt,
      bool isDeleted = false,
      required String name,
      required int price,
      int satisfaction = 3,
      @DocumentReferenceConverter()
          required DocumentReference<Object?> categoryRef}) {
    return _Income(
      reference: reference,
      earnedAt: earnedAt,
      createdAt: createdAt,
      updatedAt: updatedAt,
      isDeleted: isDeleted,
      name: name,
      price: price,
      satisfaction: satisfaction,
      categoryRef: categoryRef,
    );
  }

  Income fromJson(Map<String, Object> json) {
    return Income.fromJson(json);
  }
}

/// @nodoc
const $Income = _$IncomeTearOff();

/// @nodoc
mixin _$Income {
  @DocumentReferenceNullableConverter()
  DocumentReference<Object?>? get reference =>
      throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get earnedAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  int get satisfaction => throw _privateConstructorUsedError;
  @DocumentReferenceConverter()
  DocumentReference<Object?> get categoryRef =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IncomeCopyWith<Income> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncomeCopyWith<$Res> {
  factory $IncomeCopyWith(Income value, $Res Function(Income) then) =
      _$IncomeCopyWithImpl<$Res>;
  $Res call(
      {@DocumentReferenceNullableConverter()
          DocumentReference<Object?>? reference,
      @TimestampConverter()
          DateTime? earnedAt,
      @TimestampConverter()
          DateTime? createdAt,
      @TimestampConverter()
          DateTime? updatedAt,
      bool isDeleted,
      String name,
      int price,
      int satisfaction,
      @DocumentReferenceConverter()
          DocumentReference<Object?> categoryRef});
}

/// @nodoc
class _$IncomeCopyWithImpl<$Res> implements $IncomeCopyWith<$Res> {
  _$IncomeCopyWithImpl(this._value, this._then);

  final Income _value;
  // ignore: unused_field
  final $Res Function(Income) _then;

  @override
  $Res call({
    Object? reference = freezed,
    Object? earnedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isDeleted = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? satisfaction = freezed,
    Object? categoryRef = freezed,
  }) {
    return _then(_value.copyWith(
      reference: reference == freezed
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>?,
      earnedAt: earnedAt == freezed
          ? _value.earnedAt
          : earnedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      satisfaction: satisfaction == freezed
          ? _value.satisfaction
          : satisfaction // ignore: cast_nullable_to_non_nullable
              as int,
      categoryRef: categoryRef == freezed
          ? _value.categoryRef
          : categoryRef // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>,
    ));
  }
}

/// @nodoc
abstract class _$IncomeCopyWith<$Res> implements $IncomeCopyWith<$Res> {
  factory _$IncomeCopyWith(_Income value, $Res Function(_Income) then) =
      __$IncomeCopyWithImpl<$Res>;
  @override
  $Res call(
      {@DocumentReferenceNullableConverter()
          DocumentReference<Object?>? reference,
      @TimestampConverter()
          DateTime? earnedAt,
      @TimestampConverter()
          DateTime? createdAt,
      @TimestampConverter()
          DateTime? updatedAt,
      bool isDeleted,
      String name,
      int price,
      int satisfaction,
      @DocumentReferenceConverter()
          DocumentReference<Object?> categoryRef});
}

/// @nodoc
class __$IncomeCopyWithImpl<$Res> extends _$IncomeCopyWithImpl<$Res>
    implements _$IncomeCopyWith<$Res> {
  __$IncomeCopyWithImpl(_Income _value, $Res Function(_Income) _then)
      : super(_value, (v) => _then(v as _Income));

  @override
  _Income get _value => super._value as _Income;

  @override
  $Res call({
    Object? reference = freezed,
    Object? earnedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isDeleted = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? satisfaction = freezed,
    Object? categoryRef = freezed,
  }) {
    return _then(_Income(
      reference: reference == freezed
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>?,
      earnedAt: earnedAt == freezed
          ? _value.earnedAt
          : earnedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      satisfaction: satisfaction == freezed
          ? _value.satisfaction
          : satisfaction // ignore: cast_nullable_to_non_nullable
              as int,
      categoryRef: categoryRef == freezed
          ? _value.categoryRef
          : categoryRef // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Income implements _Income {
  const _$_Income(
      {@DocumentReferenceNullableConverter() this.reference,
      @TimestampConverter() this.earnedAt,
      @TimestampConverter() this.createdAt,
      @TimestampConverter() this.updatedAt,
      this.isDeleted = false,
      required this.name,
      required this.price,
      this.satisfaction = 3,
      @DocumentReferenceConverter() required this.categoryRef});

  factory _$_Income.fromJson(Map<String, dynamic> json) =>
      _$_$_IncomeFromJson(json);

  @override
  @DocumentReferenceNullableConverter()
  final DocumentReference<Object?>? reference;
  @override
  @TimestampConverter()
  final DateTime? earnedAt;
  @override
  @TimestampConverter()
  final DateTime? createdAt;
  @override
  @TimestampConverter()
  final DateTime? updatedAt;
  @JsonKey(defaultValue: false)
  @override
  final bool isDeleted;
  @override
  final String name;
  @override
  final int price;
  @JsonKey(defaultValue: 3)
  @override
  final int satisfaction;
  @override
  @DocumentReferenceConverter()
  final DocumentReference<Object?> categoryRef;

  @override
  String toString() {
    return 'Income(reference: $reference, earnedAt: $earnedAt, createdAt: $createdAt, updatedAt: $updatedAt, isDeleted: $isDeleted, name: $name, price: $price, satisfaction: $satisfaction, categoryRef: $categoryRef)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Income &&
            (identical(other.reference, reference) ||
                const DeepCollectionEquality()
                    .equals(other.reference, reference)) &&
            (identical(other.earnedAt, earnedAt) ||
                const DeepCollectionEquality()
                    .equals(other.earnedAt, earnedAt)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.isDeleted, isDeleted) ||
                const DeepCollectionEquality()
                    .equals(other.isDeleted, isDeleted)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.satisfaction, satisfaction) ||
                const DeepCollectionEquality()
                    .equals(other.satisfaction, satisfaction)) &&
            (identical(other.categoryRef, categoryRef) ||
                const DeepCollectionEquality()
                    .equals(other.categoryRef, categoryRef)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(reference) ^
      const DeepCollectionEquality().hash(earnedAt) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(isDeleted) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(satisfaction) ^
      const DeepCollectionEquality().hash(categoryRef);

  @JsonKey(ignore: true)
  @override
  _$IncomeCopyWith<_Income> get copyWith =>
      __$IncomeCopyWithImpl<_Income>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_IncomeToJson(this);
  }
}

abstract class _Income implements Income {
  const factory _Income(
      {@DocumentReferenceNullableConverter()
          DocumentReference<Object?>? reference,
      @TimestampConverter()
          DateTime? earnedAt,
      @TimestampConverter()
          DateTime? createdAt,
      @TimestampConverter()
          DateTime? updatedAt,
      bool isDeleted,
      required String name,
      required int price,
      int satisfaction,
      @DocumentReferenceConverter()
          required DocumentReference<Object?> categoryRef}) = _$_Income;

  factory _Income.fromJson(Map<String, dynamic> json) = _$_Income.fromJson;

  @override
  @DocumentReferenceNullableConverter()
  DocumentReference<Object?>? get reference =>
      throw _privateConstructorUsedError;
  @override
  @TimestampConverter()
  DateTime? get earnedAt => throw _privateConstructorUsedError;
  @override
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @override
  @TimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @override
  bool get isDeleted => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  int get price => throw _privateConstructorUsedError;
  @override
  int get satisfaction => throw _privateConstructorUsedError;
  @override
  @DocumentReferenceConverter()
  DocumentReference<Object?> get categoryRef =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$IncomeCopyWith<_Income> get copyWith => throw _privateConstructorUsedError;
}
