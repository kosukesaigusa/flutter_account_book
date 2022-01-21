import 'package:flutter/material.dart';
import 'package:flutter_account_book/controllers/calendar/calendar_page_state.dart';
import 'package:flutter_account_book/models/v2/daily_expense_summary/daily_expense_summary.dart';
import 'package:flutter_account_book/themes/theme.dart';
import 'package:ks_flutter_commons/ks_flutter_commons.dart';
import 'package:provider/provider.dart';

// TODO(kosukesaigusa): 固定費のモデリングを考える
const fixedFeeTotal = 106663;

/// カレンダー上部のその月の支出や収入のサマリー
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
              if (!state.loading) Text('${toJpy(fixedFeeTotal)}'),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              Text('変動費', style: grey12),
              if (!state.loading) Text('${toJpy(_monthlyExpense(state.monthlyExpense))}'),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              Text('支出計', style: grey12),
              if (!state.loading) Text('${toJpy(_monthlyTotalExpense(state.monthlyExpense))}'),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              Text('収入計', style: grey12),
              if (!state.loading) Text('${toJpy(_monthlyIncome(state.monthlyExpense))}'),
            ],
          ),
        ],
      ),
    );
  }

  /// その月の総支出（固定費と変動費の合計）
  int _monthlyTotalExpense(MonthlyExpense me) => _monthlyExpense(me) + fixedFeeTotal;

  /// その月の変動費の合計
  int _monthlyExpense(MonthlyExpense me) =>
      me.dailySummaries.map((ds) => ds.totalExpense).toList().reduce((a, b) => a + b);

  /// その月の総収入
  int _monthlyIncome(MonthlyExpense me) =>
      me.dailySummaries.map((ds) => ds.totalIncome).toList().reduce((a, b) => a + b);
}
