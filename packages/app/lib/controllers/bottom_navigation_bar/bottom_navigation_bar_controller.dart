import 'package:flutter_account_book/controllers/bottom_navigation_bar/bottom_navigation_bar_state.dart';
import 'package:flutter_account_book/utils/enums.dart';
import 'package:state_notifier/state_notifier.dart';

class BottomNavigationBarController extends StateNotifier<BottomNavigationBarState>
    with LocatorMixin {
  BottomNavigationBarController()
      : super(BottomNavigationBarState(
          currentIndex: 0,
          item: BottomNavigationBarItemEnum.home,
        ));

  /// タブを移動する
  void changeTab(int index) {
    state = state.copyWith(
      currentIndex: index,
    );
  }
}
