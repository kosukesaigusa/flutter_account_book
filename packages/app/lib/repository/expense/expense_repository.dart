import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_account_book/models/v2/expense/expense.dart';

/// Expense に関するリポジトリ
class ExpenseRepository {
  ExpenseRepository();

  static final v2ExpensesRef = V2ExpenseCollectionReference();

  static V2ExpenseDocumentReference v2ExpenseRef({
    required String userId,
  }) =>
      V2ExpenseDocumentReference(v2ExpensesRef.doc(userId).reference);

  static ExpenseCollectionReference expensesRef({
    required String userId,
  }) =>
      ExpenseCollectionReference(v2ExpenseRef(userId: userId).reference);

  static ExpenseDocumentReference expenseRef({
    required String userId,
    required String expenseId,
  }) =>
      ExpenseDocumentReference(expensesRef(userId: userId).doc(expenseId).reference);

  /// Expense 一覧を取得する。
  static Future<List<Expense>> fetchExpenses({
    required String userId,
    Source source = Source.serverAndCache,
    ExpenseQuery? Function(ExpenseQuery expenseQuery)? queryBuilder,
    int Function(Expense lhs, Expense rhs)? sort,
  }) async {
    ExpenseQuery query = expensesRef(userId: userId);
    if (queryBuilder != null) {
      query = queryBuilder(query)!;
    }
    final qs = await query.get();
    final result = qs.docs.map((qds) => qds.data).toList();
    if (sort != null) {
      result.sort(sort);
    }
    return result;
  }

  /// Expense 一覧を購読する。
  static Stream<List<Expense>> subscribeExpenses({
    required String userId,
    Source source = Source.serverAndCache,
    ExpenseQuery? Function(ExpenseQuery expenseQuery)? queryBuilder,
    int Function(Expense lhs, Expense rhs)? sort,
  }) {
    ExpenseQuery query = expensesRef(userId: userId);
    if (queryBuilder != null) {
      query = queryBuilder(query)!;
    }
    final collectionStream = query.snapshots();
    return collectionStream.map((qs) {
      final result = qs.docs.map((qds) => qds.data).toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }

  /// 指定した Expense を取得する。
  static Future<Expense?> fetchExpense({
    required String userId,
    required String expenseId,
    Source source = Source.serverAndCache,
  }) async {
    final ds = await expenseRef(
      userId: userId,
      expenseId: expenseId,
    ).get(GetOptions(source: source));
    return ds.data;
  }

  /// 指定した Expense を購読する。
  static Stream<Expense?> subscribeExpense({
    required String userId,
    required String expenseId,
  }) {
    return expenseRef(
      userId: userId,
      expenseId: expenseId,
    ).snapshots().map((ds) => ds.data);
  }
}
