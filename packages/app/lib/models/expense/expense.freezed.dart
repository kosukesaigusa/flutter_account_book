// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'expense.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Expense _$ExpenseFromJson(Map<String, dynamic> json) {
  return _Expense.fromJson(json);
}

/// @nodoc
class _$ExpenseTearOff {
  const _$ExpenseTearOff();

  _Expense call(
      {@DocumentReferenceNullableConverter()
          DocumentReference<Object?>? reference,
      @TimestampConverter()
          DateTime? paidAt,
      @TimestampConverter()
          DateTime? createdAt,
      @TimestampConverter()
          DateTime? updatedAt,
      bool isDeleted = false,
      required String name,
      required int price,
      int satisfaction = 3,
      @DocumentReferenceConverter()
          required DocumentReference<Object?> expenseCategoryRef}) {
    return _Expense(
      reference: reference,
      paidAt: paidAt,
      createdAt: createdAt,
      updatedAt: updatedAt,
      isDeleted: isDeleted,
      name: name,
      price: price,
      satisfaction: satisfaction,
      expenseCategoryRef: expenseCategoryRef,
    );
  }

  Expense fromJson(Map<String, Object> json) {
    return Expense.fromJson(json);
  }
}

/// @nodoc
const $Expense = _$ExpenseTearOff();

/// @nodoc
mixin _$Expense {
  @DocumentReferenceNullableConverter()
  DocumentReference<Object?>? get reference =>
      throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get paidAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  int get satisfaction => throw _privateConstructorUsedError;
  @DocumentReferenceConverter()
  DocumentReference<Object?> get expenseCategoryRef =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExpenseCopyWith<Expense> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseCopyWith<$Res> {
  factory $ExpenseCopyWith(Expense value, $Res Function(Expense) then) =
      _$ExpenseCopyWithImpl<$Res>;
  $Res call(
      {@DocumentReferenceNullableConverter()
          DocumentReference<Object?>? reference,
      @TimestampConverter()
          DateTime? paidAt,
      @TimestampConverter()
          DateTime? createdAt,
      @TimestampConverter()
          DateTime? updatedAt,
      bool isDeleted,
      String name,
      int price,
      int satisfaction,
      @DocumentReferenceConverter()
          DocumentReference<Object?> expenseCategoryRef});
}

/// @nodoc
class _$ExpenseCopyWithImpl<$Res> implements $ExpenseCopyWith<$Res> {
  _$ExpenseCopyWithImpl(this._value, this._then);

  final Expense _value;
  // ignore: unused_field
  final $Res Function(Expense) _then;

  @override
  $Res call({
    Object? reference = freezed,
    Object? paidAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isDeleted = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? satisfaction = freezed,
    Object? expenseCategoryRef = freezed,
  }) {
    return _then(_value.copyWith(
      reference: reference == freezed
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>?,
      paidAt: paidAt == freezed
          ? _value.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
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
      expenseCategoryRef: expenseCategoryRef == freezed
          ? _value.expenseCategoryRef
          : expenseCategoryRef // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>,
    ));
  }
}

/// @nodoc
abstract class _$ExpenseCopyWith<$Res> implements $ExpenseCopyWith<$Res> {
  factory _$ExpenseCopyWith(_Expense value, $Res Function(_Expense) then) =
      __$ExpenseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@DocumentReferenceNullableConverter()
          DocumentReference<Object?>? reference,
      @TimestampConverter()
          DateTime? paidAt,
      @TimestampConverter()
          DateTime? createdAt,
      @TimestampConverter()
          DateTime? updatedAt,
      bool isDeleted,
      String name,
      int price,
      int satisfaction,
      @DocumentReferenceConverter()
          DocumentReference<Object?> expenseCategoryRef});
}

/// @nodoc
class __$ExpenseCopyWithImpl<$Res> extends _$ExpenseCopyWithImpl<$Res>
    implements _$ExpenseCopyWith<$Res> {
  __$ExpenseCopyWithImpl(_Expense _value, $Res Function(_Expense) _then)
      : super(_value, (v) => _then(v as _Expense));

  @override
  _Expense get _value => super._value as _Expense;

  @override
  $Res call({
    Object? reference = freezed,
    Object? paidAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isDeleted = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? satisfaction = freezed,
    Object? expenseCategoryRef = freezed,
  }) {
    return _then(_Expense(
      reference: reference == freezed
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>?,
      paidAt: paidAt == freezed
          ? _value.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
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
      expenseCategoryRef: expenseCategoryRef == freezed
          ? _value.expenseCategoryRef
          : expenseCategoryRef // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Expense implements _Expense {
  const _$_Expense(
      {@DocumentReferenceNullableConverter() this.reference,
      @TimestampConverter() this.paidAt,
      @TimestampConverter() this.createdAt,
      @TimestampConverter() this.updatedAt,
      this.isDeleted = false,
      required this.name,
      required this.price,
      this.satisfaction = 3,
      @DocumentReferenceConverter() required this.expenseCategoryRef});

  factory _$_Expense.fromJson(Map<String, dynamic> json) =>
      _$_$_ExpenseFromJson(json);

  @override
  @DocumentReferenceNullableConverter()
  final DocumentReference<Object?>? reference;
  @override
  @TimestampConverter()
  final DateTime? paidAt;
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
  final DocumentReference<Object?> expenseCategoryRef;

  @override
  String toString() {
    return 'Expense(reference: $reference, paidAt: $paidAt, createdAt: $createdAt, updatedAt: $updatedAt, isDeleted: $isDeleted, name: $name, price: $price, satisfaction: $satisfaction, expenseCategoryRef: $expenseCategoryRef)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Expense &&
            (identical(other.reference, reference) ||
                const DeepCollectionEquality()
                    .equals(other.reference, reference)) &&
            (identical(other.paidAt, paidAt) ||
                const DeepCollectionEquality().equals(other.paidAt, paidAt)) &&
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
            (identical(other.expenseCategoryRef, expenseCategoryRef) ||
                const DeepCollectionEquality()
                    .equals(other.expenseCategoryRef, expenseCategoryRef)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(reference) ^
      const DeepCollectionEquality().hash(paidAt) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(isDeleted) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(satisfaction) ^
      const DeepCollectionEquality().hash(expenseCategoryRef);

  @JsonKey(ignore: true)
  @override
  _$ExpenseCopyWith<_Expense> get copyWith =>
      __$ExpenseCopyWithImpl<_Expense>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ExpenseToJson(this);
  }
}

abstract class _Expense implements Expense {
  const factory _Expense(
      {@DocumentReferenceNullableConverter()
          DocumentReference<Object?>? reference,
      @TimestampConverter()
          DateTime? paidAt,
      @TimestampConverter()
          DateTime? createdAt,
      @TimestampConverter()
          DateTime? updatedAt,
      bool isDeleted,
      required String name,
      required int price,
      int satisfaction,
      @DocumentReferenceConverter()
          required DocumentReference<Object?> expenseCategoryRef}) = _$_Expense;

  factory _Expense.fromJson(Map<String, dynamic> json) = _$_Expense.fromJson;

  @override
  @DocumentReferenceNullableConverter()
  DocumentReference<Object?>? get reference =>
      throw _privateConstructorUsedError;
  @override
  @TimestampConverter()
  DateTime? get paidAt => throw _privateConstructorUsedError;
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
  DocumentReference<Object?> get expenseCategoryRef =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ExpenseCopyWith<_Expense> get copyWith =>
      throw _privateConstructorUsedError;
}
