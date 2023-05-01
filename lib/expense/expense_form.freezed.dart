// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ExpenseForm {
  bool get loading => throw _privateConstructorUsedError;
  bool get sending => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  int get month => throw _privateConstructorUsedError;
  int get day => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;
  List<ExpenseCategory> get expenseCategories =>
      throw _privateConstructorUsedError;
  ExpenseCategory? get selectedExpenseCategory =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExpenseFormCopyWith<ExpenseForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseFormCopyWith<$Res> {
  factory $ExpenseFormCopyWith(
          ExpenseForm value, $Res Function(ExpenseForm) then) =
      _$ExpenseFormCopyWithImpl<$Res, ExpenseForm>;
  @useResult
  $Res call(
      {bool loading,
      bool sending,
      int year,
      int month,
      int day,
      String? name,
      int? price,
      List<ExpenseCategory> expenseCategories,
      ExpenseCategory? selectedExpenseCategory});

  $ExpenseCategoryCopyWith<$Res>? get selectedExpenseCategory;
}

/// @nodoc
class _$ExpenseFormCopyWithImpl<$Res, $Val extends ExpenseForm>
    implements $ExpenseFormCopyWith<$Res> {
  _$ExpenseFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? sending = null,
    Object? year = null,
    Object? month = null,
    Object? day = null,
    Object? name = freezed,
    Object? price = freezed,
    Object? expenseCategories = null,
    Object? selectedExpenseCategory = freezed,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      sending: null == sending
          ? _value.sending
          : sending // ignore: cast_nullable_to_non_nullable
              as bool,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      expenseCategories: null == expenseCategories
          ? _value.expenseCategories
          : expenseCategories // ignore: cast_nullable_to_non_nullable
              as List<ExpenseCategory>,
      selectedExpenseCategory: freezed == selectedExpenseCategory
          ? _value.selectedExpenseCategory
          : selectedExpenseCategory // ignore: cast_nullable_to_non_nullable
              as ExpenseCategory?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ExpenseCategoryCopyWith<$Res>? get selectedExpenseCategory {
    if (_value.selectedExpenseCategory == null) {
      return null;
    }

    return $ExpenseCategoryCopyWith<$Res>(_value.selectedExpenseCategory!,
        (value) {
      return _then(_value.copyWith(selectedExpenseCategory: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ExpenseFormCopyWith<$Res>
    implements $ExpenseFormCopyWith<$Res> {
  factory _$$_ExpenseFormCopyWith(
          _$_ExpenseForm value, $Res Function(_$_ExpenseForm) then) =
      __$$_ExpenseFormCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      bool sending,
      int year,
      int month,
      int day,
      String? name,
      int? price,
      List<ExpenseCategory> expenseCategories,
      ExpenseCategory? selectedExpenseCategory});

  @override
  $ExpenseCategoryCopyWith<$Res>? get selectedExpenseCategory;
}

/// @nodoc
class __$$_ExpenseFormCopyWithImpl<$Res>
    extends _$ExpenseFormCopyWithImpl<$Res, _$_ExpenseForm>
    implements _$$_ExpenseFormCopyWith<$Res> {
  __$$_ExpenseFormCopyWithImpl(
      _$_ExpenseForm _value, $Res Function(_$_ExpenseForm) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? sending = null,
    Object? year = null,
    Object? month = null,
    Object? day = null,
    Object? name = freezed,
    Object? price = freezed,
    Object? expenseCategories = null,
    Object? selectedExpenseCategory = freezed,
  }) {
    return _then(_$_ExpenseForm(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      sending: null == sending
          ? _value.sending
          : sending // ignore: cast_nullable_to_non_nullable
              as bool,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      expenseCategories: null == expenseCategories
          ? _value._expenseCategories
          : expenseCategories // ignore: cast_nullable_to_non_nullable
              as List<ExpenseCategory>,
      selectedExpenseCategory: freezed == selectedExpenseCategory
          ? _value.selectedExpenseCategory
          : selectedExpenseCategory // ignore: cast_nullable_to_non_nullable
              as ExpenseCategory?,
    ));
  }
}

/// @nodoc

class _$_ExpenseForm implements _ExpenseForm {
  const _$_ExpenseForm(
      {this.loading = true,
      this.sending = false,
      this.year = 1970,
      this.month = 1,
      this.day = 1,
      this.name,
      this.price,
      final List<ExpenseCategory> expenseCategories = const <ExpenseCategory>[],
      this.selectedExpenseCategory})
      : _expenseCategories = expenseCategories;

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool sending;
  @override
  @JsonKey()
  final int year;
  @override
  @JsonKey()
  final int month;
  @override
  @JsonKey()
  final int day;
  @override
  final String? name;
  @override
  final int? price;
  final List<ExpenseCategory> _expenseCategories;
  @override
  @JsonKey()
  List<ExpenseCategory> get expenseCategories {
    if (_expenseCategories is EqualUnmodifiableListView)
      return _expenseCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expenseCategories);
  }

  @override
  final ExpenseCategory? selectedExpenseCategory;

  @override
  String toString() {
    return 'ExpenseForm(loading: $loading, sending: $sending, year: $year, month: $month, day: $day, name: $name, price: $price, expenseCategories: $expenseCategories, selectedExpenseCategory: $selectedExpenseCategory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExpenseForm &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.sending, sending) || other.sending == sending) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            const DeepCollectionEquality()
                .equals(other._expenseCategories, _expenseCategories) &&
            (identical(
                    other.selectedExpenseCategory, selectedExpenseCategory) ||
                other.selectedExpenseCategory == selectedExpenseCategory));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loading,
      sending,
      year,
      month,
      day,
      name,
      price,
      const DeepCollectionEquality().hash(_expenseCategories),
      selectedExpenseCategory);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExpenseFormCopyWith<_$_ExpenseForm> get copyWith =>
      __$$_ExpenseFormCopyWithImpl<_$_ExpenseForm>(this, _$identity);
}

abstract class _ExpenseForm implements ExpenseForm {
  const factory _ExpenseForm(
      {final bool loading,
      final bool sending,
      final int year,
      final int month,
      final int day,
      final String? name,
      final int? price,
      final List<ExpenseCategory> expenseCategories,
      final ExpenseCategory? selectedExpenseCategory}) = _$_ExpenseForm;

  @override
  bool get loading;
  @override
  bool get sending;
  @override
  int get year;
  @override
  int get month;
  @override
  int get day;
  @override
  String? get name;
  @override
  int? get price;
  @override
  List<ExpenseCategory> get expenseCategories;
  @override
  ExpenseCategory? get selectedExpenseCategory;
  @override
  @JsonKey(ignore: true)
  _$$_ExpenseFormCopyWith<_$_ExpenseForm> get copyWith =>
      throw _privateConstructorUsedError;
}
