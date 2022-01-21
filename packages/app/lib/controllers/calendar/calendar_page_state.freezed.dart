// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'calendar_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CalendarPageStateTearOff {
  const _$CalendarPageStateTearOff();

  _CalendarPageState call(
      {bool loading = true,
      int year = 1970,
      int month = 1,
      int day = 1,
      List<DailySummary> dailySummaries = const <DailySummary>[],
      MonthlyExpense monthlyExpense =
          const MonthlyExpense(year: 1970, month: 1)}) {
    return _CalendarPageState(
      loading: loading,
      year: year,
      month: month,
      day: day,
      dailySummaries: dailySummaries,
      monthlyExpense: monthlyExpense,
    );
  }
}

/// @nodoc
const $CalendarPageState = _$CalendarPageStateTearOff();

/// @nodoc
mixin _$CalendarPageState {
  bool get loading => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  int get month => throw _privateConstructorUsedError;
  int get day => throw _privateConstructorUsedError;
  List<DailySummary> get dailySummaries => throw _privateConstructorUsedError;
  MonthlyExpense get monthlyExpense => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalendarPageStateCopyWith<CalendarPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarPageStateCopyWith<$Res> {
  factory $CalendarPageStateCopyWith(
          CalendarPageState value, $Res Function(CalendarPageState) then) =
      _$CalendarPageStateCopyWithImpl<$Res>;
  $Res call(
      {bool loading,
      int year,
      int month,
      int day,
      List<DailySummary> dailySummaries,
      MonthlyExpense monthlyExpense});
}

/// @nodoc
class _$CalendarPageStateCopyWithImpl<$Res>
    implements $CalendarPageStateCopyWith<$Res> {
  _$CalendarPageStateCopyWithImpl(this._value, this._then);

  final CalendarPageState _value;
  // ignore: unused_field
  final $Res Function(CalendarPageState) _then;

  @override
  $Res call({
    Object? loading = freezed,
    Object? year = freezed,
    Object? month = freezed,
    Object? day = freezed,
    Object? dailySummaries = freezed,
    Object? monthlyExpense = freezed,
  }) {
    return _then(_value.copyWith(
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      year: year == freezed
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      month: month == freezed
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      day: day == freezed
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      dailySummaries: dailySummaries == freezed
          ? _value.dailySummaries
          : dailySummaries // ignore: cast_nullable_to_non_nullable
              as List<DailySummary>,
      monthlyExpense: monthlyExpense == freezed
          ? _value.monthlyExpense
          : monthlyExpense // ignore: cast_nullable_to_non_nullable
              as MonthlyExpense,
    ));
  }
}

/// @nodoc
abstract class _$CalendarPageStateCopyWith<$Res>
    implements $CalendarPageStateCopyWith<$Res> {
  factory _$CalendarPageStateCopyWith(
          _CalendarPageState value, $Res Function(_CalendarPageState) then) =
      __$CalendarPageStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool loading,
      int year,
      int month,
      int day,
      List<DailySummary> dailySummaries,
      MonthlyExpense monthlyExpense});
}

/// @nodoc
class __$CalendarPageStateCopyWithImpl<$Res>
    extends _$CalendarPageStateCopyWithImpl<$Res>
    implements _$CalendarPageStateCopyWith<$Res> {
  __$CalendarPageStateCopyWithImpl(
      _CalendarPageState _value, $Res Function(_CalendarPageState) _then)
      : super(_value, (v) => _then(v as _CalendarPageState));

  @override
  _CalendarPageState get _value => super._value as _CalendarPageState;

  @override
  $Res call({
    Object? loading = freezed,
    Object? year = freezed,
    Object? month = freezed,
    Object? day = freezed,
    Object? dailySummaries = freezed,
    Object? monthlyExpense = freezed,
  }) {
    return _then(_CalendarPageState(
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      year: year == freezed
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      month: month == freezed
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      day: day == freezed
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      dailySummaries: dailySummaries == freezed
          ? _value.dailySummaries
          : dailySummaries // ignore: cast_nullable_to_non_nullable
              as List<DailySummary>,
      monthlyExpense: monthlyExpense == freezed
          ? _value.monthlyExpense
          : monthlyExpense // ignore: cast_nullable_to_non_nullable
              as MonthlyExpense,
    ));
  }
}

/// @nodoc

class _$_CalendarPageState implements _CalendarPageState {
  const _$_CalendarPageState(
      {this.loading = true,
      this.year = 1970,
      this.month = 1,
      this.day = 1,
      this.dailySummaries = const <DailySummary>[],
      this.monthlyExpense = const MonthlyExpense(year: 1970, month: 1)});

  @JsonKey()
  @override
  final bool loading;
  @JsonKey()
  @override
  final int year;
  @JsonKey()
  @override
  final int month;
  @JsonKey()
  @override
  final int day;
  @JsonKey()
  @override
  final List<DailySummary> dailySummaries;
  @JsonKey()
  @override
  final MonthlyExpense monthlyExpense;

  @override
  String toString() {
    return 'CalendarPageState(loading: $loading, year: $year, month: $month, day: $day, dailySummaries: $dailySummaries, monthlyExpense: $monthlyExpense)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CalendarPageState &&
            const DeepCollectionEquality().equals(other.loading, loading) &&
            const DeepCollectionEquality().equals(other.year, year) &&
            const DeepCollectionEquality().equals(other.month, month) &&
            const DeepCollectionEquality().equals(other.day, day) &&
            const DeepCollectionEquality()
                .equals(other.dailySummaries, dailySummaries) &&
            const DeepCollectionEquality()
                .equals(other.monthlyExpense, monthlyExpense));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(loading),
      const DeepCollectionEquality().hash(year),
      const DeepCollectionEquality().hash(month),
      const DeepCollectionEquality().hash(day),
      const DeepCollectionEquality().hash(dailySummaries),
      const DeepCollectionEquality().hash(monthlyExpense));

  @JsonKey(ignore: true)
  @override
  _$CalendarPageStateCopyWith<_CalendarPageState> get copyWith =>
      __$CalendarPageStateCopyWithImpl<_CalendarPageState>(this, _$identity);
}

abstract class _CalendarPageState implements CalendarPageState {
  const factory _CalendarPageState(
      {bool loading,
      int year,
      int month,
      int day,
      List<DailySummary> dailySummaries,
      MonthlyExpense monthlyExpense}) = _$_CalendarPageState;

  @override
  bool get loading;
  @override
  int get year;
  @override
  int get month;
  @override
  int get day;
  @override
  List<DailySummary> get dailySummaries;
  @override
  MonthlyExpense get monthlyExpense;
  @override
  @JsonKey(ignore: true)
  _$CalendarPageStateCopyWith<_CalendarPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
