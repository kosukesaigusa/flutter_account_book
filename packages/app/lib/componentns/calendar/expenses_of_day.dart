import 'package:flutter/material.dart';
import 'package:flutter_account_book/pages/expense_add/expense_add_page.dart';
import 'package:flutter_account_book/themes/theme.dart';
import 'package:flutter_account_book/view_models/calendar/calendar_view_model.dart';
import 'package:ks_flutter_commons/ks_flutter_commons.dart';
import 'package:provider/provider.dart';

class ExpensesOfDaySliverList extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Consumer<CalendarViewModel>(
        builder: (context, vm, child) {
          final count = vm.expensesOfDay.length;
          if (count == 0) {
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
                final expense = vm.expensesOfDay[index];
                return Padding(
                  padding: EdgeInsets.only(
                    top: index == 0 ? 16 : 0,
                    bottom: index == count - 1 ? 80 : 0,
                  ),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.of(context).push<void>(
                        MaterialPageRoute(
                          builder: (context) => ExpenseAddPage(expense: expense),
                          fullscreenDialog: true,
                        ),
                      );
                      await CalendarViewModel().fetchExpensesAndIncomes();
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
                          Text(
                            '${toJpy(expense.price)}',
                            style: bold,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              childCount: count,
            ),
          );
        },
      );
}
