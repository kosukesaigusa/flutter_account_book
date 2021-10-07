import 'package:flutter/material.dart';

class CategoryAddPageViewModel extends ChangeNotifier {
  CategoryAddPageViewModel();
  String name = '';
  int? budget;
  String? errorName;
  String? errorBudget;

  void changeName(String s) {
    name = s;
    if (name.isEmpty) {
      errorName = '入力してください。';
    }
    if (name.length > 20) {
      errorName = '20 文字以内で入力してください。';
    }
    validate();
    notifyListeners();
  }

  void changeBudget(String s) {
    budget = int.parse(s);
    if (budget == null) {
      errorBudget = '正しい値を入力してください。';
    }
    if (budget! < 0) {
      errorBudget = '正しい値を入力してください。';
    }
    validate();
    notifyListeners();
  }

  bool validate() {
    if (name.isEmpty) {
      return false;
    }
    if (name.length > 20) {
      return false;
    }
    if (budget == null) {
      return false;
    }
    if (budget! < 0) {
      return false;
    }
    return true;
  }
}
