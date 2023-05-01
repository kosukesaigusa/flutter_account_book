import 'package:cloud_firestore/cloud_firestore.dart';

import 'expense/expense.dart';
import 'expense_category/expense_category.dart';

final _db = FirebaseFirestore.instance;

/// v2Expense コレクションの参照。
final v2ExpenseRef = _db.collection('v2Expense');

/// expenses コレクションの参照。
final expensesRef = _db
    .collection('v2Expense')
    .doc('hWou6fxFY6MZcGFxpHKkYcH4Iym2')
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
DocumentReference<Expense> expenseRef({required String expenseId}) =>
    expensesRef.doc(expenseId);

/// expenseCategories コレクションの参照。
final expenseCategoriesRef = _db
    .collection('v2ExpenseCategory')
    .doc('hWou6fxFY6MZcGFxpHKkYcH4Iym2')
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
  required String expenseCategoryId,
}) =>
    expenseCategoriesRef.doc(expenseCategoryId);
