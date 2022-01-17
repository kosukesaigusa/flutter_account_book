import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_account_book/controllers/bottom_navigation_bar/bottom_navigation_bar_controller.dart';
import 'package:flutter_account_book/controllers/bottom_navigation_bar/bottom_navigation_bar_state.dart';
import 'package:flutter_account_book/pages/calendar/calendar_page.dart';
import 'package:flutter_account_book/pages/category/category_page.dart';
import 'package:flutter_account_book/pages/category_add/category_add_page.dart';
import 'package:flutter_account_book/pages/expense_add/expense_add_page.dart';
import 'package:flutter_account_book/repository/auth/auth_repository.dart';
import 'package:flutter_account_book/utils/enums.dart';
import 'package:flutter_account_book/view_models/calendar/calendar_view_model.dart';
import 'package:flutter_account_book/view_models/category/category_view_model.dart';
import 'package:ks_flutter_commons/ks_flutter_commons.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const path = '/';
  static const name = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(context),
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
              index: context.watch<BottomNavigationBarState>().currentIndex,
              children: const <Widget>[
                CalendarPage(),
                CategoryPage(),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final index = context.read<BottomNavigationBarState>().currentIndex;
          if (index == 0) {
            await Navigator.pushNamed<void>(context, '${ExpenseAddPage.path}?fullScreenDialog=1');
            await CalendarViewModel().fetchExpensesAndIncomes();
            return;
          }
          if (index == 1) {
            await Navigator.pushNamed<void>(context, '${CategoryAddPage.path}?fullScreenDialog=1');
            await CalendarViewModel().fetchExpensesAndIncomes();
            return;
          }
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: BottomNavigationBarItemEnum.home.icon,
            label: BottomNavigationBarItemEnum.home.label,
          ),
          BottomNavigationBarItem(
            icon: BottomNavigationBarItemEnum.category.icon,
            label: BottomNavigationBarItemEnum.category.label,
          ),
        ],
        currentIndex: context.watch<BottomNavigationBarState>().currentIndex,
        onTap: context.read<BottomNavigationBarController>().changeTab,
      ),
    );
  }
}

/// ドロワー
Drawer _buildDrawer(BuildContext context) => Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerHeader(context),
                _buildSignOutDrawerItem(context),
              ],
            ),
          ),
        ],
      ),
    );

/// ドロワーヘッダー
Widget _buildDrawerHeader(BuildContext context) {
  return DrawerHeader(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [],
    ),
  );
}

ListTile _buildSignOutDrawerItem(BuildContext context) => ListTile(
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
                    await AuthRepository.signOut();
                    RootWidget.restart(context);
                  },
                ),
              ],
            );
          },
        );
      },
    );
