import 'package:flutter/material.dart';
import 'package:flutter_account_book/controllers/calendar/calendar_page_state.dart';
import 'package:flutter_account_book/models/v2/daily_expense_summary/daily_expense_summary.dart';
import 'package:flutter_account_book/themes/theme.dart';
import 'package:ks_flutter_commons/ks_flutter_commons.dart';
import 'package:provider/provider.dart';

class ExpenseIncomeTotalWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<CalendarPageState>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        children: [
          Column(
            children: [
              Text('固定費', style: grey12),
              if (!state.loading) Text('${toJpy(106663)}'),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              Text('変動費', style: grey12),
              if (!state.loading) Text('${toJpy(_monthlyExpenses(state.monthlyExpense))}'),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              Text('支出計', style: grey12),
              if (!state.loading) Text('${toJpy(_monthlyIncomes(state.monthlyExpense))}'),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              Text('収入計', style: grey12),
              if (!state.loading) Text('${toJpy(_monthlyIncomes(state.monthlyExpense))}'),
            ],
          ),
        ],
      ),
    );
  }

  /// その月の総支出
  int _monthlyExpenses(MonthlyExpense me) =>
      me.dailySummaries.map((ds) => ds.totalExpense).toList().reduce((a, b) => a + b);

  /// その月の総収入
  int _monthlyIncomes(MonthlyExpense me) =>
      me.dailySummaries.map((ds) => ds.totalIncome).toList().reduce((a, b) => a + b);
}
