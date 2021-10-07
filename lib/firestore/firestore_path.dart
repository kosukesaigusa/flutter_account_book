import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_account_book/store/store.dart';

class FirestorePath {
  final store = Store();
  static CollectionReference<Map<String, dynamic>> expenseCollectionRef() =>
      Store().db.collection('expensesV1').doc(Store().currentUser.uid).collection('expenses');
  static CollectionReference<Map<String, dynamic>> cateogoryCollectionRef() =>
      Store().db.collection('categoryV1').doc(Store().currentUser.uid).collection('categories');
}
