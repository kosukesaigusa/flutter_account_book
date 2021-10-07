import 'package:flutter/material.dart';

class CategoryViewModel extends ChangeNotifier {
  factory CategoryViewModel() => _instance;
  CategoryViewModel._internal();
  static final CategoryViewModel _instance = CategoryViewModel._internal();
}
