import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_account_book/models/v2/expense_category/expense_category.dart';

/// ExpenseCategory に関するリポジトリ
class ExpenseCategoryRepository {
  ExpenseCategoryRepository();

  static final v2ExpenseCategoriesRef = V2ExpenseCategoryCollectionReference();

  static V2ExpenseCategoryDocumentReference v2ExpenseCategoryRef({
    required String userId,
  }) =>
      V2ExpenseCategoryDocumentReference(v2ExpenseCategoriesRef.doc(userId).reference);

  static ExpenseCategoryCollectionReference expenseCategoriesRef({
    required String userId,
  }) =>
      ExpenseCategoryCollectionReference(v2ExpenseCategoryRef(userId: userId).reference);

  static ExpenseCategoryDocumentReference expenseCategoryRef({
    required String userId,
    required String expenseCategoryId,
  }) =>
      ExpenseCategoryDocumentReference(
          expenseCategoriesRef(userId: userId).doc(expenseCategoryId).reference);

  /// ExpenseCategory 一覧を取得する。
  static Future<List<ExpenseCategory>> fetchExpenseCategories({
    required String userId,
    Source source = Source.serverAndCache,
    ExpenseCategoryQuery? Function(ExpenseCategoryQuery expenseCategoryQuery)? queryBuilder,
    int Function(ExpenseCategory lhs, ExpenseCategory rhs)? compare,
  }) async {
    ExpenseCategoryQuery query = expenseCategoriesRef(userId: userId);
    if (queryBuilder != null) {
      query = queryBuilder(query)!;
    }
    final qs = await query.get();
    final result = qs.docs.map((qds) => qds.data).toList();
    if (compare != null) {
      result.sort(compare);
    }
    return result;
  }

  /// ExpenseCategory 一覧を購読する。
  static Stream<List<ExpenseCategory>> subscribeExpenseCategories({
    required String userId,
    Source source = Source.serverAndCache,
    ExpenseCategoryQuery? Function(ExpenseCategoryQuery expenseCategoryQuery)? queryBuilder,
    int Function(ExpenseCategory lhs, ExpenseCategory rhs)? compare,
  }) {
    ExpenseCategoryQuery query = expenseCategoriesRef(userId: userId);
    if (queryBuilder != null) {
      query = queryBuilder(query)!;
    }
    final collectionStream = query.snapshots();
    return collectionStream.map((qs) {
      final result = qs.docs.map((qds) => qds.data).toList();
      if (compare != null) {
        result.sort(compare);
      }
      return result;
    });
  }

  /// 指定した ExpenseCategory を取得する。
  static Future<ExpenseCategory?> fetchExpenseCategory({
    required String userId,
    required String expenseCategoryId,
    Source source = Source.serverAndCache,
  }) async {
    final ds = await expenseCategoryRef(
      userId: userId,
      expenseCategoryId: expenseCategoryId,
    ).get(GetOptions(source: source));
    return ds.data;
  }

  /// 指定した ExpenseCategory を購読する。
  static Stream<ExpenseCategory?> subscribeExpenseCategory({
    required String userId,
    required String expenseCategoryId,
  }) {
    return expenseCategoryRef(
      userId: userId,
      expenseCategoryId: expenseCategoryId,
    ).snapshots().map((ds) => ds.data);
  }
}
