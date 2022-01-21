import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_add_page_state.freezed.dart';

@freezed
class CategoryAddPageState with _$CategoryAddPageState {
  const factory CategoryAddPageState({
    @Default(true) bool loading,
  }) = _CategoryAddPageState;
}
