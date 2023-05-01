// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bottom_navigation_bar_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BottomNavigationBarState {
  int get currentIndex => throw _privateConstructorUsedError;
  BottomNavigationBarItemEnum get item => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BottomNavigationBarStateCopyWith<BottomNavigationBarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BottomNavigationBarStateCopyWith<$Res> {
  factory $BottomNavigationBarStateCopyWith(BottomNavigationBarState value,
          $Res Function(BottomNavigationBarState) then) =
      _$BottomNavigationBarStateCopyWithImpl<$Res, BottomNavigationBarState>;
  @useResult
  $Res call({int currentIndex, BottomNavigationBarItemEnum item});
}

/// @nodoc
class _$BottomNavigationBarStateCopyWithImpl<$Res,
        $Val extends BottomNavigationBarState>
    implements $BottomNavigationBarStateCopyWith<$Res> {
  _$BottomNavigationBarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentIndex = null,
    Object? item = null,
  }) {
    return _then(_value.copyWith(
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as BottomNavigationBarItemEnum,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TabStateCopyWith<$Res>
    implements $BottomNavigationBarStateCopyWith<$Res> {
  factory _$$_TabStateCopyWith(
          _$_TabState value, $Res Function(_$_TabState) then) =
      __$$_TabStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int currentIndex, BottomNavigationBarItemEnum item});
}

/// @nodoc
class __$$_TabStateCopyWithImpl<$Res>
    extends _$BottomNavigationBarStateCopyWithImpl<$Res, _$_TabState>
    implements _$$_TabStateCopyWith<$Res> {
  __$$_TabStateCopyWithImpl(
      _$_TabState _value, $Res Function(_$_TabState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentIndex = null,
    Object? item = null,
  }) {
    return _then(_$_TabState(
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as BottomNavigationBarItemEnum,
    ));
  }
}

/// @nodoc

class _$_TabState implements _TabState {
  _$_TabState(
      {this.currentIndex = 0, this.item = BottomNavigationBarItemEnum.home});

  @override
  @JsonKey()
  final int currentIndex;
  @override
  @JsonKey()
  final BottomNavigationBarItemEnum item;

  @override
  String toString() {
    return 'BottomNavigationBarState(currentIndex: $currentIndex, item: $item)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TabState &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex) &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentIndex, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TabStateCopyWith<_$_TabState> get copyWith =>
      __$$_TabStateCopyWithImpl<_$_TabState>(this, _$identity);
}

abstract class _TabState implements BottomNavigationBarState {
  factory _TabState(
      {final int currentIndex,
      final BottomNavigationBarItemEnum item}) = _$_TabState;

  @override
  int get currentIndex;
  @override
  BottomNavigationBarItemEnum get item;
  @override
  @JsonKey(ignore: true)
  _$$_TabStateCopyWith<_$_TabState> get copyWith =>
      throw _privateConstructorUsedError;
}
