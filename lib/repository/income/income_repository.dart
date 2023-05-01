import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_account_book/models/v2/income/income.dart';

/// Income に関するリポジトリ
class IncomeRepository {
  IncomeRepository();

  static final v2IncomesRef = V2IncomeCollectionReference();

  static V2IncomeDocumentReference v2IncomeRef({
    required String userId,
  }) =>
      V2IncomeDocumentReference(v2IncomesRef.doc(userId).reference);

  static IncomeCollectionReference incomesRef({
    required String userId,
  }) =>
      IncomeCollectionReference(v2IncomeRef(userId: userId).reference);

  static IncomeDocumentReference incomeRef({
    required String userId,
    required String incomeId,
  }) =>
      IncomeDocumentReference(incomesRef(userId: userId).doc(incomeId).reference);

  /// Income 一覧を取得する。
  static Future<List<Income>> fetchIncomes({
    required String userId,
    Source source = Source.serverAndCache,
    IncomeQuery? Function(IncomeQuery incomeQuery)? queryBuilder,
    int Function(Income lhs, Income rhs)? compare,
  }) async {
    IncomeQuery query = incomesRef(userId: userId);
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

  /// Income 一覧を購読する。
  static Stream<List<Income>> subscribeIncomes({
    required String userId,
    Source source = Source.serverAndCache,
    IncomeQuery? Function(IncomeQuery incomeQuery)? queryBuilder,
    int Function(Income lhs, Income rhs)? compare,
  }) {
    IncomeQuery query = incomesRef(userId: userId);
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

  /// 指定した Income を取得する。
  static Future<Income?> fetchIncome({
    required String userId,
    required String incomeId,
    Source source = Source.serverAndCache,
  }) async {
    final ds = await incomeRef(
      userId: userId,
      incomeId: incomeId,
    ).get(GetOptions(source: source));
    return ds.data;
  }

  /// 指定した Income を購読する。
  static Stream<Income?> subscribeIncome({
    required String userId,
    required String incomeId,
  }) {
    return incomeRef(
      userId: userId,
      incomeId: incomeId,
    ).snapshots().map((ds) => ds.data);
  }
}
