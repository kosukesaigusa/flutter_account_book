import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../date_time.dart';
import '../../scaffold_messenger_controller.dart';
import '../expense_form_state_notifier.dart';

@RoutePage()

/// 支出を登録・編集する画面。
class ExpenseFormPage extends ConsumerWidget {
  const ExpenseFormPage({super.key});

  static const path = '/expenseForm';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(expenseFormStateNotifierProvider);
    final originalExpense = ref.watch(originalExpenseStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(originalExpense == null ? '支出の登録' : '支出の編集'),
        actions: [
          if (originalExpense == null)
            const SizedBox()
          else
            IconButton(
              onPressed: () async {
                final navigator = Navigator.of(context);
                final result = await ref
                    .read(expenseFormStateNotifierProvider.notifier)
                    .deleteExpense(originalExpense.expenseId);
                if (!result) {
                  return;
                }
                navigator.pop();
                ref
                    .read(mainScaffoldMessengerControllerProvider)
                    .showSnackBar('支出を削除しました。');
              },
              icon: const Icon(Icons.delete),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => ref
                      .read(expenseFormStateNotifierProvider.notifier)
                      .selectPreviousDay(),
                  icon: const Icon(Icons.arrow_back_ios_outlined),
                ),
                const Gap(16),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.amber[200],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    DateTime(
                      state.year,
                      state.month,
                      state.day,
                    ).toYYYYMMDD(),
                  ),
                ),
                const Gap(16),
                IconButton(
                  onPressed: () => ref
                      .read(expenseFormStateNotifierProvider.notifier)
                      .selectNextDay(),
                  icon: const Icon(Icons.arrow_forward_ios_outlined),
                ),
              ],
            ),
            const Gap(16),
            Row(
              children: [
                const SizedBox(
                  width: 80,
                  child: Text('メモ', overflow: TextOverflow.ellipsis),
                ),
                Expanded(
                  child: TextField(
                    controller: ref.watch(
                      expenseFormStateNotifierProvider.notifier.select(
                        (notifier) => notifier.nameTextEditingController,
                      ),
                    ),
                    minLines: 1,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      isDense: true,
                      border: OutlineInputBorder(),
                      hintText: '支出の内容',
                    ),
                  ),
                ),
              ],
            ),
            const Gap(16),
            Row(
              children: [
                const SizedBox(
                  width: 80,
                  child: Text(
                    '値段（円）',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: ref.watch(
                      expenseFormStateNotifierProvider.notifier.select(
                        (notifier) => notifier.priceTextEditingController,
                      ),
                    ),
                    minLines: 1,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                    ],
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      isDense: true,
                      border: OutlineInputBorder(),
                      hintText: '支出（円）',
                    ),
                  ),
                ),
              ],
            ),
            const Gap(16),
            const Text('カテゴリー'),
            const Gap(8),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  ...List.generate(
                    state.expenseCategories.length,
                    (index) => InkWell(
                      onTap: () => ref
                          .read(expenseFormStateNotifierProvider.notifier)
                          .selectExpenseCategory(
                            state.expenseCategories[index],
                          ),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: state.selectedExpenseCategory ==
                                    state.expenseCategories[index]
                                ? Theme.of(context).colorScheme.primary
                                : Colors.grey[200]!,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                state.expenseCategories[index].name,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Gap(8),
                            const Icon(Icons.restaurant),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(16),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: state.sending
                    ? null
                    : () async {
                        final navigator = Navigator.of(context);
                        final result = originalExpense == null
                            ? await ref
                                .read(
                                  expenseFormStateNotifierProvider.notifier,
                                )
                                .addExpense()
                            : await ref
                                .read(
                                  expenseFormStateNotifierProvider.notifier,
                                )
                                .updateExpense();
                        if (!result) {
                          return;
                        }
                        navigator.pop();
                        ref
                            .read(mainScaffoldMessengerControllerProvider)
                            .showSnackBar(
                              originalExpense == null
                                  ? '支出を登録しました。'
                                  : '支出を更新しました。',
                            );
                      },
                child: const Text('保存する'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
