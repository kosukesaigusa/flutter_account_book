import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_account_book/store/store.dart';

class FirestorePath {
  final store = Store();

  static CollectionReference<Map<String, dynamic>> get expenseCollectionRef =>
      Store().db.collection('expenseV1').doc(Store().currentUser.uid).collection('expenses');

  static CollectionReference<Map<String, dynamic>> get incomeCollectionRef =>
      Store().db.collection('incomeV1').doc(Store().currentUser.uid).collection('incomes');

  static CollectionReference<Map<String, dynamic>> get expenseCateogoryCollectionRef => Store()
      .db
      .collection('expenseCategoryV1')
      .doc(Store().currentUser.uid)
      .collection('expenseCategories');

  static CollectionReference<Map<String, dynamic>> get incomeCateogoryCollectionRef => Store()
      .db
      .collection('incomeCategoryV1')
      .doc(Store().currentUser.uid)
      .collection('incomeCategories');
}
