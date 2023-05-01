import 'package:flutter_account_book/utils/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bottom_navigation_bar_state.freezed.dart';

@freezed
class BottomNavigationBarState with _$BottomNavigationBarState {
  factory BottomNavigationBarState({
    @Default(0) int currentIndex,
    @Default(BottomNavigationBarItemEnum.home) BottomNavigationBarItemEnum item,
  }) = _TabState;
}
