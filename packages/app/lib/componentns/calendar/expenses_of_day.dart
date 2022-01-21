import 'package:flutter/material.dart';
import 'package:flutter_account_book/controllers/calendar/calendar_page_controller.dart';
import 'package:flutter_account_book/controllers/calendar/calendar_page_state.dart';
import 'package:flutter_account_book/themes/theme.dart';
import 'package:flutter_account_book/utils/utility_methods.dart';
import 'package:ks_flutter_commons/ks_flutter_commons.dart';
import 'package:provider/provider.dart';

class ExpensesOfDaySliverList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<CalendarPageState>();
    final expenses = state.dailySummaries[state.day].expenses;
    // final incomes = state.dailySummaries[state.day].incomes;
    if (expenses.isEmpty) {
      return SliverList(
        delegate: SliverChildListDelegate([
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text('支出はありません。'),
          ),
        ]),
      );
    }
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final expense = expenses[index];
          return Padding(
            padding: const EdgeInsets.all(0),
            child: InkWell(
              onTap: () async {
                // await Navigator.of(context).push<void>(
                //   MaterialPageRoute(
                //     builder: (context) => ExpenseAddPage(expense: expense),
                //     fullscreenDialog: true,
                //   ),
                // );
                showFloatingSnackBar(context, 'まだ何も起こりません。');
                await context.read<CalendarPageController>().fetch();
                return;
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                child: Row(
                  children: [
                    Expanded(child: Text(expense.name)),
                    Text('${toJpy(expense.price)}', style: bold),
                  ],
                ),
              ),
            ),
          );
        },
        childCount: expenses.length,
      ),
    );
  }
}
