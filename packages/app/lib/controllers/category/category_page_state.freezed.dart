// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'category_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CategoryPageStateTearOff {
  const _$CategoryPageStateTearOff();

  _CategoryPageState call(
      {bool loading = true,
      List<ExpenseCategory> expenseCategories = const <ExpenseCategory>[],
      List<IncomeCategory> incomeCategories = const <IncomeCategory>[]}) {
    return _CategoryPageState(
      loading: loading,
      expenseCategories: expenseCategories,
      incomeCategories: incomeCategories,
    );
  }
}

/// @nodoc
const $CategoryPageState = _$CategoryPageStateTearOff();

/// @nodoc
mixin _$CategoryPageState {
  bool get loading => throw _privateConstructorUsedError;
  List<ExpenseCategory> get expenseCategories =>
      throw _privateConstructorUsedError;
  List<IncomeCategory> get incomeCategories =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryPageStateCopyWith<CategoryPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryPageStateCopyWith<$Res> {
  factory $CategoryPageStateCopyWith(
          CategoryPageState value, $Res Function(CategoryPageState) then) =
      _$CategoryPageStateCopyWithImpl<$Res>;
  $Res call(
      {bool loading,
      List<ExpenseCategory> expenseCategories,
      List<IncomeCategory> incomeCategories});
}

/// @nodoc
class _$CategoryPageStateCopyWithImpl<$Res>
    implements $CategoryPageStateCopyWith<$Res> {
  _$CategoryPageStateCopyWithImpl(this._value, this._then);

  final CategoryPageState _value;
  // ignore: unused_field
  final $Res Function(CategoryPageState) _then;

  @override
  $Res call({
    Object? loading = freezed,
    Object? expenseCategories = freezed,
    Object? incomeCategories = freezed,
  }) {
    return _then(_value.copyWith(
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      expenseCategories: expenseCategories == freezed
          ? _value.expenseCategories
          : expenseCategories // ignore: cast_nullable_to_non_nullable
              as List<ExpenseCategory>,
      incomeCategories: incomeCategories == freezed
          ? _value.incomeCategories
          : incomeCategories // ignore: cast_nullable_to_non_nullable
              as List<IncomeCategory>,
    ));
  }
}

/// @nodoc
abstract class _$CategoryPageStateCopyWith<$Res>
    implements $CategoryPageStateCopyWith<$Res> {
  factory _$CategoryPageStateCopyWith(
          _CategoryPageState value, $Res Function(_CategoryPageState) then) =
      __$CategoryPageStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool loading,
      List<ExpenseCategory> expenseCategories,
      List<IncomeCategory> incomeCategories});
}

/// @nodoc
class __$CategoryPageStateCopyWithImpl<$Res>
    extends _$CategoryPageStateCopyWithImpl<$Res>
    implements _$CategoryPageStateCopyWith<$Res> {
  __$CategoryPageStateCopyWithImpl(
      _CategoryPageState _value, $Res Function(_CategoryPageState) _then)
      : super(_value, (v) => _then(v as _CategoryPageState));

  @override
  _CategoryPageState get _value => super._value as _CategoryPageState;

  @override
  $Res call({
    Object? loading = freezed,
    Object? expenseCategories = freezed,
    Object? incomeCategories = freezed,
  }) {
    return _then(_CategoryPageState(
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      expenseCategories: expenseCategories == freezed
          ? _value.expenseCategories
          : expenseCategories // ignore: cast_nullable_to_non_nullable
              as List<ExpenseCategory>,
      incomeCategories: incomeCategories == freezed
          ? _value.incomeCategories
          : incomeCategories // ignore: cast_nullable_to_non_nullable
              as List<IncomeCategory>,
    ));
  }
}

/// @nodoc

class _$_CategoryPageState implements _CategoryPageState {
  const _$_CategoryPageState(
      {this.loading = true,
      this.expenseCategories = const <ExpenseCategory>[],
      this.incomeCategories = const <IncomeCategory>[]});

  @JsonKey()
  @override
  final bool loading;
  @JsonKey()
  @override
  final List<ExpenseCategory> expenseCategories;
  @JsonKey()
  @override
  final List<IncomeCategory> incomeCategories;

  @override
  String toString() {
    return 'CategoryPageState(loading: $loading, expenseCategories: $expenseCategories, incomeCategories: $incomeCategories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryPageState &&
            const DeepCollectionEquality().equals(other.loading, loading) &&
            const DeepCollectionEquality()
                .equals(other.expenseCategories, expenseCategories) &&
            const DeepCollectionEquality()
                .equals(other.incomeCategories, incomeCategories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(loading),
      const DeepCollectionEquality().hash(expenseCategories),
      const DeepCollectionEquality().hash(incomeCategories));

  @JsonKey(ignore: true)
  @override
  _$CategoryPageStateCopyWith<_CategoryPageState> get copyWith =>
      __$CategoryPageStateCopyWithImpl<_CategoryPageState>(this, _$identity);
}

abstract class _CategoryPageState implements CategoryPageState {
  const factory _CategoryPageState(
      {bool loading,
      List<ExpenseCategory> expenseCategories,
      List<IncomeCategory> incomeCategories}) = _$_CategoryPageState;

  @override
  bool get loading;
  @override
  List<ExpenseCategory> get expenseCategories;
  @override
  List<IncomeCategory> get incomeCategories;
  @override
  @JsonKey(ignore: true)
  _$CategoryPageStateCopyWith<_CategoryPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
