// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CalendarState {
  bool get loading => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  int get month => throw _privateConstructorUsedError;
  int get day => throw _privateConstructorUsedError;
  List<DailySummary> get dailySummaries => throw _privateConstructorUsedError;
  MonthlyExpense get monthlyExpense => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalendarStateCopyWith<CalendarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarStateCopyWith<$Res> {
  factory $CalendarStateCopyWith(
          CalendarState value, $Res Function(CalendarState) then) =
      _$CalendarStateCopyWithImpl<$Res, CalendarState>;
  @useResult
  $Res call(
      {bool loading,
      int year,
      int month,
      int day,
      List<DailySummary> dailySummaries,
      MonthlyExpense monthlyExpense});
}

/// @nodoc
class _$CalendarStateCopyWithImpl<$Res, $Val extends CalendarState>
    implements $CalendarStateCopyWith<$Res> {
  _$CalendarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? year = null,
    Object? month = null,
    Object? day = null,
    Object? dailySummaries = null,
    Object? monthlyExpense = null,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
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
      dailySummaries: null == dailySummaries
          ? _value.dailySummaries
          : dailySummaries // ignore: cast_nullable_to_non_nullable
              as List<DailySummary>,
      monthlyExpense: null == monthlyExpense
          ? _value.monthlyExpense
          : monthlyExpense // ignore: cast_nullable_to_non_nullable
              as MonthlyExpense,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CalendarPageStateCopyWith<$Res>
    implements $CalendarStateCopyWith<$Res> {
  factory _$$_CalendarPageStateCopyWith(_$_CalendarPageState value,
          $Res Function(_$_CalendarPageState) then) =
      __$$_CalendarPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      int year,
      int month,
      int day,
      List<DailySummary> dailySummaries,
      MonthlyExpense monthlyExpense});
}

/// @nodoc
class __$$_CalendarPageStateCopyWithImpl<$Res>
    extends _$CalendarStateCopyWithImpl<$Res, _$_CalendarPageState>
    implements _$$_CalendarPageStateCopyWith<$Res> {
  __$$_CalendarPageStateCopyWithImpl(
      _$_CalendarPageState _value, $Res Function(_$_CalendarPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? year = null,
    Object? month = null,
    Object? day = null,
    Object? dailySummaries = null,
    Object? monthlyExpense = null,
  }) {
    return _then(_$_CalendarPageState(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
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
      dailySummaries: null == dailySummaries
          ? _value._dailySummaries
          : dailySummaries // ignore: cast_nullable_to_non_nullable
              as List<DailySummary>,
      monthlyExpense: null == monthlyExpense
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
      final List<DailySummary> dailySummaries = const <DailySummary>[],
      this.monthlyExpense = const MonthlyExpense(year: 1970, month: 1)})
      : _dailySummaries = dailySummaries;

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final int year;
  @override
  @JsonKey()
  final int month;
  @override
  @JsonKey()
  final int day;
  final List<DailySummary> _dailySummaries;
  @override
  @JsonKey()
  List<DailySummary> get dailySummaries {
    if (_dailySummaries is EqualUnmodifiableListView) return _dailySummaries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dailySummaries);
  }

  @override
  @JsonKey()
  final MonthlyExpense monthlyExpense;

  @override
  String toString() {
    return 'CalendarState(loading: $loading, year: $year, month: $month, day: $day, dailySummaries: $dailySummaries, monthlyExpense: $monthlyExpense)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CalendarPageState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.day, day) || other.day == day) &&
            const DeepCollectionEquality()
                .equals(other._dailySummaries, _dailySummaries) &&
            (identical(other.monthlyExpense, monthlyExpense) ||
                other.monthlyExpense == monthlyExpense));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, year, month, day,
      const DeepCollectionEquality().hash(_dailySummaries), monthlyExpense);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CalendarPageStateCopyWith<_$_CalendarPageState> get copyWith =>
      __$$_CalendarPageStateCopyWithImpl<_$_CalendarPageState>(
          this, _$identity);
}

abstract class _CalendarPageState implements CalendarState {
  const factory _CalendarPageState(
      {final bool loading,
      final int year,
      final int month,
      final int day,
      final List<DailySummary> dailySummaries,
      final MonthlyExpense monthlyExpense}) = _$_CalendarPageState;

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
  _$$_CalendarPageStateCopyWith<_$_CalendarPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
