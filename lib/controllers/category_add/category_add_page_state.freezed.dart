// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_add_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CategoryAddPageState {
  bool get loading => throw _privateConstructorUsedError;
  bool get sending => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryAddPageStateCopyWith<CategoryAddPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryAddPageStateCopyWith<$Res> {
  factory $CategoryAddPageStateCopyWith(CategoryAddPageState value,
          $Res Function(CategoryAddPageState) then) =
      _$CategoryAddPageStateCopyWithImpl<$Res, CategoryAddPageState>;
  @useResult
  $Res call({bool loading, bool sending});
}

/// @nodoc
class _$CategoryAddPageStateCopyWithImpl<$Res,
        $Val extends CategoryAddPageState>
    implements $CategoryAddPageStateCopyWith<$Res> {
  _$CategoryAddPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? sending = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategoryAddPageStateCopyWith<$Res>
    implements $CategoryAddPageStateCopyWith<$Res> {
  factory _$$_CategoryAddPageStateCopyWith(_$_CategoryAddPageState value,
          $Res Function(_$_CategoryAddPageState) then) =
      __$$_CategoryAddPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, bool sending});
}

/// @nodoc
class __$$_CategoryAddPageStateCopyWithImpl<$Res>
    extends _$CategoryAddPageStateCopyWithImpl<$Res, _$_CategoryAddPageState>
    implements _$$_CategoryAddPageStateCopyWith<$Res> {
  __$$_CategoryAddPageStateCopyWithImpl(_$_CategoryAddPageState _value,
      $Res Function(_$_CategoryAddPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? sending = null,
  }) {
    return _then(_$_CategoryAddPageState(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      sending: null == sending
          ? _value.sending
          : sending // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_CategoryAddPageState implements _CategoryAddPageState {
  const _$_CategoryAddPageState({this.loading = true, this.sending = false});

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool sending;

  @override
  String toString() {
    return 'CategoryAddPageState(loading: $loading, sending: $sending)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryAddPageState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.sending, sending) || other.sending == sending));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, sending);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryAddPageStateCopyWith<_$_CategoryAddPageState> get copyWith =>
      __$$_CategoryAddPageStateCopyWithImpl<_$_CategoryAddPageState>(
          this, _$identity);
}

abstract class _CategoryAddPageState implements CategoryAddPageState {
  const factory _CategoryAddPageState(
      {final bool loading, final bool sending}) = _$_CategoryAddPageState;

  @override
  bool get loading;
  @override
  bool get sending;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryAddPageStateCopyWith<_$_CategoryAddPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
