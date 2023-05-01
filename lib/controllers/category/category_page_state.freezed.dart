// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      _$CategoryPageStateCopyWithImpl<$Res, CategoryPageState>;
  @useResult
  $Res call(
      {bool loading,
      List<ExpenseCategory> expenseCategories,
      List<IncomeCategory> incomeCategories});
}

/// @nodoc
class _$CategoryPageStateCopyWithImpl<$Res, $Val extends CategoryPageState>
    implements $CategoryPageStateCopyWith<$Res> {
  _$CategoryPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? expenseCategories = null,
    Object? incomeCategories = null,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      expenseCategories: null == expenseCategories
          ? _value.expenseCategories
          : expenseCategories // ignore: cast_nullable_to_non_nullable
              as List<ExpenseCategory>,
      incomeCategories: null == incomeCategories
          ? _value.incomeCategories
          : incomeCategories // ignore: cast_nullable_to_non_nullable
              as List<IncomeCategory>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategoryPageStateCopyWith<$Res>
    implements $CategoryPageStateCopyWith<$Res> {
  factory _$$_CategoryPageStateCopyWith(_$_CategoryPageState value,
          $Res Function(_$_CategoryPageState) then) =
      __$$_CategoryPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      List<ExpenseCategory> expenseCategories,
      List<IncomeCategory> incomeCategories});
}

/// @nodoc
class __$$_CategoryPageStateCopyWithImpl<$Res>
    extends _$CategoryPageStateCopyWithImpl<$Res, _$_CategoryPageState>
    implements _$$_CategoryPageStateCopyWith<$Res> {
  __$$_CategoryPageStateCopyWithImpl(
      _$_CategoryPageState _value, $Res Function(_$_CategoryPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? expenseCategories = null,
    Object? incomeCategories = null,
  }) {
    return _then(_$_CategoryPageState(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      expenseCategories: null == expenseCategories
          ? _value._expenseCategories
          : expenseCategories // ignore: cast_nullable_to_non_nullable
              as List<ExpenseCategory>,
      incomeCategories: null == incomeCategories
          ? _value._incomeCategories
          : incomeCategories // ignore: cast_nullable_to_non_nullable
              as List<IncomeCategory>,
    ));
  }
}

/// @nodoc

class _$_CategoryPageState implements _CategoryPageState {
  const _$_CategoryPageState(
      {this.loading = true,
      final List<ExpenseCategory> expenseCategories = const <ExpenseCategory>[],
      final List<IncomeCategory> incomeCategories = const <IncomeCategory>[]})
      : _expenseCategories = expenseCategories,
        _incomeCategories = incomeCategories;

  @override
  @JsonKey()
  final bool loading;
  final List<ExpenseCategory> _expenseCategories;
  @override
  @JsonKey()
  List<ExpenseCategory> get expenseCategories {
    if (_expenseCategories is EqualUnmodifiableListView)
      return _expenseCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expenseCategories);
  }

  final List<IncomeCategory> _incomeCategories;
  @override
  @JsonKey()
  List<IncomeCategory> get incomeCategories {
    if (_incomeCategories is EqualUnmodifiableListView)
      return _incomeCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_incomeCategories);
  }

  @override
  String toString() {
    return 'CategoryPageState(loading: $loading, expenseCategories: $expenseCategories, incomeCategories: $incomeCategories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryPageState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality()
                .equals(other._expenseCategories, _expenseCategories) &&
            const DeepCollectionEquality()
                .equals(other._incomeCategories, _incomeCategories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loading,
      const DeepCollectionEquality().hash(_expenseCategories),
      const DeepCollectionEquality().hash(_incomeCategories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryPageStateCopyWith<_$_CategoryPageState> get copyWith =>
      __$$_CategoryPageStateCopyWithImpl<_$_CategoryPageState>(
          this, _$identity);
}

abstract class _CategoryPageState implements CategoryPageState {
  const factory _CategoryPageState(
      {final bool loading,
      final List<ExpenseCategory> expenseCategories,
      final List<IncomeCategory> incomeCategories}) = _$_CategoryPageState;

  @override
  bool get loading;
  @override
  List<ExpenseCategory> get expenseCategories;
  @override
  List<IncomeCategory> get incomeCategories;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryPageStateCopyWith<_$_CategoryPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
