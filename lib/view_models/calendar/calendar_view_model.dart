import 'package:flutter/material.dart';
import 'package:flutter_account_book/store/store.dart';

class CalendarViewModel extends ChangeNotifier {
  factory CalendarViewModel() => _instance;
  CalendarViewModel._internal();
  static final CalendarViewModel _instance = CalendarViewModel._internal();

  int year = DateTime.now().year;
  int month = DateTime.now().month;
  int day = DateTime.now().day;
  final store = Store();

  void onDateCellTapped(int number) {
    day = number;
    notifyListeners();
  }

  void showNextMonth() {
    final nextMonth = DateTime(year, month + 1);
    year = nextMonth.year;
    month = nextMonth.month;
    day = 1;
    notifyListeners();
  }

  void showPreviousMonth() {
    final previousMonth = DateTime(year, month - 1);
    year = previousMonth.year;
    month = previousMonth.month;
    day = 1;
    notifyListeners();
  }
}
