// ignore_for_file: avoid_classes_with_only_static_members

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_account_book/repository/auth/auth_repository.dart';
import 'package:flutter_account_book/utils/utils.dart';

class FirestorePath {
  static CollectionReference<Map<String, dynamic>> get expenseCollectionRef =>
      db.collection('expenseV1').doc(AuthRepository.nonNullUser.uid).collection('expenses');

  static CollectionReference<Map<String, dynamic>> get incomeCollectionRef =>
      db.collection('incomeV1').doc(AuthRepository.nonNullUser.uid).collection('incomes');

  static CollectionReference<Map<String, dynamic>> get expenseCateogoryCollectionRef => db
      .collection('expenseCategoryV1')
      .doc(AuthRepository.nonNullUser.uid)
      .collection('expenseCategories');

  static CollectionReference<Map<String, dynamic>> get incomeCateogoryCollectionRef => db
      .collection('incomeCategoryV1')
      .doc(AuthRepository.nonNullUser.uid)
      .collection('incomeCategories');
}
