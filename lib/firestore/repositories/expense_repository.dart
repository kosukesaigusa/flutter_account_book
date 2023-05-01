import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../expense/expense.dart';
import '../../firestore_refs.dart';

final expenseRepositoryProvider = Provider.autoDispose<ExpenseRepository>(
  (_) => ExpenseRepository(),
);

class ExpenseRepository {
  ExpenseRepository();

  String get _userId => FirebaseAuth.instance.currentUser!.uid;

  /// [Expense] を登録する。
  Future<void> saveExpense({required Expense expense}) =>
      expensesRef(userId: _userId).add(expense);

  /// 指定した [Expense] を削除する。
  Future<void> deleteExpense({required String expenseId}) =>
      expenseRef(userId: _userId, expenseId: expenseId).delete();

  /// 指定した月月の [Expense] 一覧を取得する。
  Future<List<Expense>> fetchExpenses({
    required int year,
    required int month,
  }) async {
    final firstTimestamp = Timestamp.fromDate(DateTime(year, month));
    final lastTimestamp = Timestamp.fromDate(DateTime(year, month + 1, 0));
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
