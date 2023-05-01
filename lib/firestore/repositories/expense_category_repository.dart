import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../logger.dart';
import '../firestore_refs.dart';
import '../models/expense_category.dart';

final expenseCategoryRepositoryProvider =
    Provider.autoDispose<ExpenseCategoryRepository>(
  (_) => ExpenseCategoryRepository(),
);

class ExpenseCategoryRepository {
  ExpenseCategoryRepository();

  String get _userId => FirebaseAuth.instance.currentUser!.uid;

  Future<ExpenseCategory?> fetchExpenseCategory({
    required String expenseCategoryId,
  }) async {
    final ds = await expenseCategoryRef(
      userId: _userId,
      expenseCategoryId: expenseCategoryId,
    ).get();
    if (!ds.exists) {
      logger.warning('Document not found: ${ds.reference.path}');
      return null;
    }
    return ds.data();
  }

  Future<List<ExpenseCategory>> fetchExpenseCategories() async {
    final qs =
        await expenseCategoriesRef(userId: _userId).orderBy('order').get();
    final result = qs.docs.map((qds) => qds.data()).toList();
    return result;
  }
}
