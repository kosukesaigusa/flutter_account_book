import 'package:flutter/material.dart';
import 'package:flutter_account_book/pages/home/home_page.dart';
import 'package:flutter_account_book/pages/not_found/not_found_page.dart';
import 'package:flutter_account_book/utils/types.dart';

/// ページ一覧
final routeDict = <String, PageBuilder>{
  HomePage.path: (_, args) => const HomePage(key: ValueKey(HomePage.name)),
  NotFoundPage.path: (_, args) => const NotFoundPage(key: ValueKey(NotFoundPage.name)),
};
