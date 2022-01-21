import 'package:flutter_account_book/controllers/category_add/category_add_page_state.dart';
import 'package:flutter_account_book/controllers/snack_bar/snack_bar_controller.dart';
import 'package:state_notifier/state_notifier.dart';

class CategoryAddPageController extends StateNotifier<CategoryAddPageState> with LocatorMixin {
  CategoryAddPageController() : super(const CategoryAddPageState());

  SnackBarController get snackBarController => read();

  @override
  void initState() {
    print('');
    super.initState();
  }
}
