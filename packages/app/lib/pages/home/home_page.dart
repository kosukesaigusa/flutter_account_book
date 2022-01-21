import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_account_book/controllers/bottom_navigation_bar/bottom_navigation_bar_controller.dart';
import 'package:flutter_account_book/controllers/bottom_navigation_bar/bottom_navigation_bar_state.dart';
import 'package:flutter_account_book/controllers/calendar/calendar_page_controller.dart';
import 'package:flutter_account_book/models/v2/expense/expense.dart';
import 'package:flutter_account_book/pages/calendar/calendar_page.dart';
import 'package:flutter_account_book/pages/category/category_page.dart';
import 'package:flutter_account_book/pages/category_add/category_add_page.dart';
import 'package:flutter_account_book/pages/expense_add/expense_add_page.dart';
import 'package:flutter_account_book/repository/auth/auth_repository.dart';
import 'package:flutter_account_book/repository/expense/expense_repository.dart';
import 'package:flutter_account_book/utils/enums.dart';
import 'package:flutter_account_book/utils/utility_methods.dart';
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
      body: Stack(
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final index = context.read<BottomNavigationBarState>().currentIndex;
          if (index == 0) {
            await Navigator.pushNamed<void>(context, '${ExpenseAddPage.path}?fullScreenDialog=1');
            await context.read<CalendarPageController>().fetch();
            return;
          }
          if (index == 1) {
            await Navigator.pushNamed<void>(context, '${CategoryAddPage.path}?fullScreenDialog=1');
            await context.read<CalendarPageController>().fetch();
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
                _buildMigrateExpensesDrawerItem(context),
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

/// サインアウトする
ListTile _buildSignOutDrawerItem(BuildContext context) => ListTile(
      leading: const Icon(Icons.logout_outlined),
      title: const Text('サインアウト'),
      onTap: () async {
        await AuthRepository.signOut();
        RootWidget.restart(context);
      },
    );

/// V1 の Expenses を v2 のデータにコピーする
ListTile _buildMigrateExpensesDrawerItem(BuildContext context) => ListTile(
      leading: const Icon(Icons.copy),
      title: const Text('V1 の支出を V2 にコピーする'),
      onTap: () async {
        final qs =
            await db.collection('expenseV1').doc(AuthRepository.uid).collection('expenses').get();
        for (final qds in qs.docs) {
          final data = qds.data();
          final expense = Expense(
            expenseId: qds.id,
            name: data['name'] as String,
            price: data['price'] as int,
            expenseCategoryId: (data['expenseCategoryRef'] as DocumentReference).id,
            paidAt: (data['paidAt'] as Timestamp).toDate().toIso8601String(),
            satisfaction: 3,
            isDeleted: data['isDeleted'] as bool,
          );
          await ExpenseRepository.expenseRef(
            userId: AuthRepository.uid,
            expenseId: qds.id,
          ).set(expense);
        }
        await showDialog<void>(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('${qs.docs.length} 件分のデータのコピーが完了しました。'),
            );
          },
        );
      },
    );
