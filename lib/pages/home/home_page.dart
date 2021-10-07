import 'package:flutter/material.dart';
import 'package:flutter_account_book/pages/calendar/calendart_page.dart';
import 'package:flutter_account_book/pages/category/category_page.dart';
import 'package:flutter_account_book/store/store.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Store>(
      builder: (context, store, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('ホーム'),
          ),
          body: Stack(
            children: <Widget>[
              IndexedStack(
                index: store.tabIndex,
                children: stackedPages,
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: bottomNavBarItems,
            currentIndex: store.tabIndex,
            onTap: store.changeTab,
          ),
        );
      },
    );
  }

  /// ホーム・シェア・マイページの 3 画面
  final stackedPages = <Widget>[
    CalendarPage(),
    CategoryPage(),
  ];

  final List<BottomNavigationBarItem> bottomNavBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'カレンダー',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.share),
      label: 'カテゴリー',
    ),
  ];
}
