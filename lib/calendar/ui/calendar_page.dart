import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../auth/auth.dart';
import '../../expense/ui/daily_expense.dart';
import '../../expense/ui/monthly_expense_summary.dart';
import '../../router/router.dart';
import '../../router/router.gr.dart';
import '../calendar.dart';
import 'calendar.dart';

@RoutePage()
class CalendarPage extends ConsumerWidget {
  const CalendarPage({super.key});

  static const path = '/calendar';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text(ref.watch(userIdProvider).value ?? 'ログインしていません。'),
            ),
            ListTile(
              title: const Text('サインアウト'),
              onTap: () async {
                await ref.read(signOutProvider).call();
                await ref
                    .read(appRouterProvider)
                    .replaceAll([const SignInRoute()]);
              },
            ),
            // 他のリストアイテムをここに追加できます
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(monthlyExpensesFutureProvider);
        },
        child: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              flexibleSpace: FlexibleSpaceBar(title: SelectedMonth()),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [const MonthlyExpenseSummary(), const Calendar()],
              ),
            ),
            const DailyExpenses(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await ref.read(appRouterProvider).push(const ExpenseFormRoute());
          ref.invalidate(monthlyExpensesFutureProvider);
          return;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
