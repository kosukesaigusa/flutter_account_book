import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../calendar/calendar.dart';
import '../../int.dart';

/// カレンダー上部のその月の支出や収入のサマリー
class MonthlyExpenseSummary extends ConsumerWidget {
  const MonthlyExpenseSummary({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalExpense = ref.watch(monthlyTotalExpenseProvider);
    final fixedFee = ref.watch(monthlyTotalFixedFeeProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              const Text('固定費'),
              Text(fixedFee.toJpy),
            ],
          ),
          Column(
            children: [
              const Text('変動費'),
              Text(totalExpense.toJpy),
            ],
          ),
          Column(
            children: [
              const Text('支出計'),
              Text((fixedFee + totalExpense).toJpy),
            ],
          ),
        ],
      ),
    );
  }
}
