import 'package:cloud_firestore/cloud_firestore.dart';

import 'models/expense.dart';
import 'models/expense_category.dart';

final _db = FirebaseFirestore.instance;

/// v2Expense コレクションの参照。
final v2ExpenseRef = _db.collection('v2Expense');

/// expenses コレクションの参照。
CollectionReference<Expense> expensesRef({required String userId}) => _db
        .collection('v2Expense')
        .doc(userId)
        .collection('expenses')
        .withConverter(
      fromFirestore: (ds, _) {
        return Expense.fromDocumentSnapshot(ds);
      },
      toFirestore: (obj, _) {
        final json = obj.toJson();
        return json;
      },
    );

/// expense ドキュメントの参照。
DocumentReference<Expense> expenseRef({
  required String userId,
  required String expenseId,
}) =>
    expensesRef(userId: userId).doc(expenseId);

/// expenseCategories コレクションの参照。
CollectionReference<ExpenseCategory> expenseCategoriesRef({
  required String userId,
}) =>
    _db
        .collection('v2ExpenseCategory')
        .doc(userId)
        .collection('expenseCategories')
        .withConverter(
      fromFirestore: (ds, _) {
        return ExpenseCategory.fromDocumentSnapshot(ds);
      },
      toFirestore: (obj, _) {
        final json = obj.toJson();
        return json;
      },
    );

/// expenseCategory ドキュメントの参照。
DocumentReference<ExpenseCategory> expenseCategoryRef({
  required String userId,
  required String expenseCategoryId,
}) =>
    expenseCategoriesRef(userId: userId).doc(expenseCategoryId);
