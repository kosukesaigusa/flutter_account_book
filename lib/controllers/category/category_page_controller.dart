import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_account_book/controllers/category/category_page_state.dart';
import 'package:flutter_account_book/controllers/snack_bar/snack_bar_controller.dart';
import 'package:flutter_account_book/repository/expense_category/expense_category_repository.dart';
import 'package:flutter_account_book/utils/utils.dart';
import 'package:state_notifier/state_notifier.dart';

class CategoryPageController extends StateNotifier<CategoryPageState> with LocatorMixin {
  CategoryPageController() : super(const CategoryPageState());

  SnackBarController get snackBarController => read();

  @override
  void initState() {
    fetch();
    super.initState();
  }

  Future<void> fetch() async {
    await Future.wait<void>([
      fetchExpenseCategories(),
    ]);
    state = state.copyWith(loading: false);
  }

  Future<void> fetchExpenseCategories() async {
    final expenseCategories = await ExpenseCategoryRepository.fetchExpenseCategories(
      userId: nonNullUid,
      queryBuilder: (q) => q.whereIsDeleted(isNotEqualTo: true).orderByIsDeleted().orderByOrder()
      //.orderByUpdatedAt()
      ,
    );
    state = state.copyWith(expenseCategories: expenseCategories);
  }

  Future<void> reorderExpenseCategories({
    required int oldIndex,
    required int newIndex,
  }) async {
    final batch = db.batch();
    var newIndex2 = newIndex;
    if (oldIndex < newIndex) {
      newIndex2 -= 1;
    }
    state.expenseCategories.insert(newIndex2, state.expenseCategories.removeAt(oldIndex));
    for (var i = 0; i < state.expenseCategories.length; i++) {
      // 型安全ではないのは、いまは妥協する
      batch.update(
        ExpenseCategoryRepository.expenseCategoryRef(
          userId: nonNullUid,
          expenseCategoryId: state.expenseCategories[i].expenseCategoryId,
        ).reference,
        <String, dynamic>{'order': i},
      );
    }
    try {
      await batch.commit();
      state = state.copyWith(expenseCategories: state.expenseCategories);
    } on FirebaseException catch (e) {
      snackBarController.showByFirebaseException(e);
      return;
    } on Exception catch (e) {
      snackBarController.showByException(e);
    }
  }
}
