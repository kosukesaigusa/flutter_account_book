import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../firestore_refs.dart';
import '../models/expense.dart';

final expenseRepositoryProvider = Provider.autoDispose<ExpenseRepository>(
  (_) => ExpenseRepository(),
);

class ExpenseRepository {
  ExpenseRepository();

  String get _userId => FirebaseAuth.instance.currentUser!.uid;

  /// [Expense] を登録する。
  Future<void> addExpense({required Expense expense}) =>
      expensesRef(userId: _userId).add(expense);

  /// [Expense] を更新する。
  Future<void> updateExpense({
    required String expenseId,
    required String name,
    required int price,
    required String expenseCategoryId,
    required DateTime paidAt,
  }) =>
      expenseRef(userId: _userId, expenseId: expenseId)
          .update(<String, dynamic>{
        'name': name,
        'price': price,
        'expenseCategoryId': expenseCategoryId,
        'paidAt': paidAt,
      });

  /// 指定した [Expense] を削除する。
  Future<void> deleteExpense({required String expenseId}) =>
      expenseRef(userId: _userId, expenseId: expenseId).delete();

  /// 指定した月月の [Expense] 一覧を取得する。
  Future<List<Expense>> fetchExpenses({
    required int year,
    required int month,
  }) async {
    final firstTimestamp = Timestamp.fromDate(DateTime(year, month));
    final lastTimestamp = Timestamp.fromDate(DateTime(year, month + 1));
    final qs = await expensesRef(userId: _userId)
        .where('paidAt', isGreaterThanOrEqualTo: firstTimestamp)
        .where('paidAt', isLessThanOrEqualTo: lastTimestamp)
        .get();
    final result = qs.docs.map((qds) => qds.data()).toList();
    return result;
  }

  Future<List<Expense>> fetch() async {
    final qs = await expensesRef(userId: _userId).get();
    final result = qs.docs.map((qds) => qds.data()).toList();
    return result;
  }
}
