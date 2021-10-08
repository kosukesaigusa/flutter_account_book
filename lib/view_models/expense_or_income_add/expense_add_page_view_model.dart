import 'package:flutter/material.dart';
import 'package:flutter_account_book/firestore/firestore_service.dart';
import 'package:flutter_account_book/models/category/category.dart';
import 'package:flutter_account_book/view_models/calendar/calendar_view_model.dart';

class ExpenseAddPageViewModel extends ChangeNotifier {
  ExpenseAddPageViewModel();
  int year = CalendarViewModel().year;
  int month = CalendarViewModel().month;
  int day = CalendarViewModel().day;
  String name = '';
  int? price;
  String? errorName;
  String? errorPrice;
  List<Category> categories = [];
  int selectedCategoryIndex = 0;

  Future<void> init() async {
    categories = await fetchCategories();
    notifyListeners();
  }

  void showNextDay() {
    final nextDay = DateTime(year, month, day + 1);
    year = nextDay.year;
    month = nextDay.month;
    day = nextDay.day;
    notifyListeners();
  }

  void showPreviousDay() {
    final previousDay = DateTime(year, month, day - 1);
    year = previousDay.year;
    month = previousDay.month;
    day = previousDay.day;
    notifyListeners();
  }

  void selectCategory(int index) {
    selectedCategoryIndex = index;
    notifyListeners();
  }

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

  void changePrice(String s) {
    price = int.parse(s);
    if (price == null) {
      errorPrice = '正しい値を入力してください。';
    }
    if (price! < 0) {
      errorPrice = '正しい値を入力してください。';
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
    if (price == null) {
      return false;
    }
    if (price! < 0) {
      return false;
    }
    return true;
  }
}
