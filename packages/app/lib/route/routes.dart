import 'package:flutter/material.dart';
import 'package:flutter_account_book/pages/category_add/category_add_page.dart';
import 'package:flutter_account_book/pages/expense_add/expense_add_page.dart';
import 'package:flutter_account_book/pages/home/home_page.dart';
import 'package:flutter_account_book/pages/not_found/not_found_page.dart';
import 'package:flutter_account_book/utils/types.dart';

/// ページ一覧
final routeDict = <String, PageBuilder>{
  HomePage.path: (_, args) => const HomePage(key: ValueKey(HomePage.name)),
  ExpenseAddPage.path: (_, args) => const ExpenseAddPage(key: ValueKey(ExpenseAddPage.name)),
  CategoryAddPage.path: (_, args) => const CategoryAddPage(key: ValueKey(CategoryAddPage.name)),
  NotFoundPage.path: (_, args) => const NotFoundPage(key: ValueKey(NotFoundPage.name)),
};
