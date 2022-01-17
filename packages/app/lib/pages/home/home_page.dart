import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_account_book/pages/calendar/calendar_page.dart';
import 'package:flutter_account_book/pages/category/category_page.dart';
import 'package:flutter_account_book/pages/category_add/category_add_page.dart';
import 'package:flutter_account_book/pages/expense_add/expense_add_page.dart';
import 'package:flutter_account_book/store/store.dart';
import 'package:flutter_account_book/utils/utility_methods.dart';
import 'package:flutter_account_book/view_models/calendar/calendar_view_model.dart';
import 'package:flutter_account_book/view_models/category/category_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final store = Store();
  @override
  Widget build(BuildContext context) {
    return Consumer<Store>(
      builder: (context, store, child) {
        return Scaffold(
          drawer: drawer(context),
          body: MultiProvider(
            providers: [
              ChangeNotifierProvider<CalendarViewModel>.value(
                value: CalendarViewModel()..fetchExpensesAndIncomes(source: Source.cache),
              ),
              ChangeNotifierProvider<CategoryViewModel>.value(
                value: CategoryViewModel()..fetchCategories(),
              ),
            ],
            child: Stack(
              children: <Widget>[
                IndexedStack(
                  index: store.tabIndex,
                  children: stackedPages,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              if (store.tabIndex == 0) {
                await pushPage(
                  context: context,
                  page: ExpenseAddPage(),
                  fullscreenDialog: true,
                );
                await CalendarViewModel().fetchExpensesAndIncomes();
                return;
              }
              if (store.tabIndex == 1) {
                await pushPage(
                  context: context,
                  page: CategoryAddPage(),
                  fullscreenDialog: true,
                );
                return;
              }
            },
            child: const Icon(Icons.add),
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

Widget drawerHeader(BuildContext context) {
  return DrawerHeader(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [],
    ),
  );
}

/// ドロワー
Drawer drawer(BuildContext context) => Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                drawerHeader(context),
                signOutDrawerItem(context),
                const Divider(),
                adminActionDrawerItem(context),
              ],
            ),
          ),
        ],
      ),
    );

ListTile signOutDrawerItem(BuildContext context) => ListTile(
      leading: const Icon(Icons.logout_outlined),
      title: const Text('サインアウト'),
      onTap: () async {
        await showDialog<void>(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: const Text('確認'),
              content: const Text('サインアウトしても良いですか？'),
              actions: <Widget>[
                TextButton(
                  child: Text(
                    'キャンセル',
                    style: TextStyle(color: Theme.of(context).disabledColor),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                TextButton(
                  child: const Text('サインアウトする'),
                  onPressed: () async {
                    await Store().signOut();
                    await Navigator.of(context).pushNamedAndRemoveUntil(
                      '/sign-in/',
                      (route) => false,
                    );
                  },
                ),
              ],
            );
          },
        );
      },
    );

ListTile adminActionDrawerItem(BuildContext context) => ListTile(
      leading: const Icon(Icons.logout_outlined),
      title: const Text('アドミン操作'),
      onTap: () async {
        await showDialog<void>(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: const Text('確認'),
              content: const Text('実行しますか？'),
              actions: <Widget>[
                TextButton(
                  child: Text(
                    'キャンセル',
                    style: TextStyle(color: Theme.of(context).disabledColor),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                TextButton(
                  child: const Text('実行する'),
                  onPressed: () async {
                    showFloatingSnackBar(context, 'まだ何も起こりません。');
                  },
                ),
              ],
            );
          },
        );
      },
    );
