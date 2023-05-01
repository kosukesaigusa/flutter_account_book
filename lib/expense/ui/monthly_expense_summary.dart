import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../calendar/calendar_state_notifier.dart';
import '../../int.dart';
import '../daily_expense_summary.dart';

// TODO: 固定費のモデリング・実装方法を考える
const fixedFeeTotal = 150000;

/// カレンダー上部のその月の支出や収入のサマリー
class MonthlyExpenseSummary extends ConsumerWidget {
  const MonthlyExpenseSummary({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(calendarStateNotifierProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        children: [
          Column(
            children: [
              const Text(
                '固定費',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              if (!state.loading) Text(fixedFeeTotal.toJpy),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              const Text(
                '変動費',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              if (!state.loading)
                Text(_monthlyExpense(state.monthlyExpense).toJpy),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              const Text(
                '支出計',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              if (!state.loading)
                Text(_monthlyTotalExpense(state.monthlyExpense).toJpy),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }

  /// その月の総支出（固定費と変動費の合計）
  int _monthlyTotalExpense(MonthlyExpense me) =>
      _monthlyExpense(me) + fixedFeeTotal;

  /// その月の変動費の合計
  int _monthlyExpense(MonthlyExpense me) => me.dailySummaries
      .map((ds) => ds.totalExpense)
      .toList()
      .reduce((a, b) => a + b);
}
