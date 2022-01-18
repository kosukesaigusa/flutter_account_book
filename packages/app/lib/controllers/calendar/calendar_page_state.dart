import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_page_state.freezed.dart';

@freezed
class CalendarPageState with _$CalendarPageState {
  const factory CalendarPageState({
    @Default(true) bool loading,
    int? year,
    int? month,
    @Default(0) int day,
  }) = _CalendarPageState;
}
