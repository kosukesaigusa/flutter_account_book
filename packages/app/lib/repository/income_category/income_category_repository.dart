import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_account_book/models/v2/income_category/income_category.dart';

/// IncomeCategory に関するリポジトリ
class IncomeCategoryRepository {
  IncomeCategoryRepository();

  static final v2ExpenseCategoriesRef = V2IncomeCategoryCollectionReference();

  static V2IncomeCategoryDocumentReference v2IncomeCategoryRef({
    required String userId,
  }) =>
      V2IncomeCategoryDocumentReference(v2ExpenseCategoriesRef.doc(userId).reference);

  static IncomeCategoryCollectionReference incomeCategoriesRef({
    required String userId,
  }) =>
      IncomeCategoryCollectionReference(v2IncomeCategoryRef(userId: userId).reference);

  static IncomeCategoryDocumentReference incomeCategoryRef({
    required String userId,
    required String incomeCategoryId,
  }) =>
      IncomeCategoryDocumentReference(
          incomeCategoriesRef(userId: userId).doc(incomeCategoryId).reference);

  /// IncomeCategory 一覧を取得する。
  static Future<List<IncomeCategory>> fetchExpenseCategories({
    required String userId,
    Source source = Source.serverAndCache,
    IncomeCategoryQuery? Function(IncomeCategoryQuery incomeCategoryQuery)? queryBuilder,
    int Function(IncomeCategory lhs, IncomeCategory rhs)? sort,
  }) async {
    IncomeCategoryQuery query = incomeCategoriesRef(userId: userId);
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

  /// IncomeCategory 一覧を購読する。
  static Stream<List<IncomeCategory>> subscribeExpenseCategories({
    required String userId,
    Source source = Source.serverAndCache,
    IncomeCategoryQuery? Function(IncomeCategoryQuery incomeCategoryQuery)? queryBuilder,
    int Function(IncomeCategory lhs, IncomeCategory rhs)? sort,
  }) {
    IncomeCategoryQuery query = incomeCategoriesRef(userId: userId);
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

  /// 指定した IncomeCategory を取得する。
  static Future<IncomeCategory?> fetchIncomeCategory({
    required String userId,
    required String incomeCategoryId,
    Source source = Source.serverAndCache,
  }) async {
    final ds = await incomeCategoryRef(
      userId: userId,
      incomeCategoryId: incomeCategoryId,
    ).get(GetOptions(source: source));
    return ds.data;
  }

  /// 指定した IncomeCategory を購読する。
  static Stream<IncomeCategory?> subscribeIncomeCategory({
    required String userId,
    required String incomeCategoryId,
  }) {
    return incomeCategoryRef(
      userId: userId,
      incomeCategoryId: incomeCategoryId,
    ).snapshots().map((ds) => ds.data);
  }
}
