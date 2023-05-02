import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../calendar/calendar.dart';
import '../../int.dart';
import '../../router/router.dart';
import '../../router/router.gr.dart';
import '../expense_form_state_notifier.dart';

/// カレンダー下部のその日の支出一覧。
class DailyExpenses extends ConsumerWidget {
  const DailyExpenses({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDay = ref.watch(selectedDayStateProvider);
    final monthlyExpensesByDay = ref.watch(monthlyExpensesByDayProvider);
    final expenses =
        monthlyExpensesByDay[DayEnum.fromDay(selectedDay.day)] ?? [];
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
            padding:
                EdgeInsets.only(bottom: index == expenses.length - 1 ? 60 : 4),
            child: InkWell(
              onTap: () async {
                ref
                    .read(originalExpenseStateProvider.notifier)
                    .update((s) => expense);
                await ref
                    .read(appRouterProvider)
                    .push(const ExpenseFormRoute());
                ref
                    .read(originalExpenseStateProvider.notifier)
                    .update((s) => null);
                ref.invalidate(monthlyExpensesFutureProvider);
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
                      expense.price.toJpy,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
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
