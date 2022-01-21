import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_account_book/constatnts/calendar/calendar_constants.dart';
import 'package:flutter_account_book/constatnts/expense_add/constants.dart';
import 'package:flutter_account_book/controllers/expense_add/expense_add_page_controller.dart';
import 'package:flutter_account_book/controllers/expense_add/expense_add_page_state.dart';
import 'package:flutter_account_book/models/v1/expense/expense.dart';
import 'package:flutter_account_book/themes/theme.dart';
import 'package:flutter_account_book/utils/utils.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:gap/gap.dart';
import 'package:ks_flutter_commons/ks_flutter_commons.dart';
import 'package:provider/provider.dart';

class ExpenseAddPage extends StatelessWidget {
  const ExpenseAddPage({
    Key? key,
    this.expense,
  }) : super(key: key);

  static const path = '/expense-add/';
  static const name = 'ExpenseAddPage';

  final Expense? expense;

  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<ExpenseAddPageController, ExpenseAddPageState>(
      create: (_) => ExpenseAddPageController(year: 2022, month: 1, day: 18),
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('支出の登録'),
            actions: const [
              // vm.editingMode
              //     ? IconButton(
              //         onPressed: () async {
              //           final ref = expense?.reference;
              //           if (ref == null) {
              //             showFloatingSnackBar(context, 'エラーが発生しました。');
              //             return;
              //           }
              //           await deleteData(docRef: ref);
              //           Navigator.pop(context);
              //           await CalendarViewModel().fetchExpensesAndIncomes();
              //           showFloatingSnackBar(context, '支出を削除しました。');
              //         },
              //         icon: const Icon(Icons.delete),
              //       )
              //     : const SizedBox(),
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: context.read<ExpenseAddPageController>().selectPreviousDay,
                        child: const Icon(
                          Icons.arrow_back_ios_outlined,
                          size: arrowIconSize,
                          color: Colors.black,
                        ),
                      ),
                      const Gap(16),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.amber[200],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(_selectedDateTimeString(
                          context.watch<ExpenseAddPageState>().year,
                          context.watch<ExpenseAddPageState>().month,
                          context.watch<ExpenseAddPageState>().day,
                        )),
                      ),
                      const Gap(16),
                      InkWell(
                        onTap: context.read<ExpenseAddPageController>().selectNextDay,
                        child: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: arrowIconSize,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const Gap(16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: textLabelWidth,
                        child: Text(
                          'メモ',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller:
                              context.select<ExpenseAddPageController, TextEditingController>(
                                  (c) => c.nameTextEditingController),
                          minLines: 1,
                          maxLines: 1,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            isDense: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
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
                        width: textLabelWidth,
                        child: Text(
                          '値段（円）',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller:
                              context.select<ExpenseAddPageController, TextEditingController>(
                                  (c) => c.priceTextEditingController),
                          minLines: 1,
                          maxLines: 1,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            isDense: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
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
                          context.watch<ExpenseAddPageState>().expenseCategories.length,
                          (index) => InkWell(
                            onTap: () {
                              context.read<ExpenseAddPageController>().selectExpenseCategory(
                                  context.read<ExpenseAddPageState>().expenseCategories[index]);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: context
                                              .watch<ExpenseAddPageState>()
                                              .selectedExpenseCategory ==
                                          context
                                              .watch<ExpenseAddPageState>()
                                              .expenseCategories[index]
                                      ? Theme.of(context).colorScheme.primary
                                      : grey200,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Text(
                                      '${context.watch<ExpenseAddPageState>().expenseCategories[index].name}',
                                      style: bold12,
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
                      onPressed: context.watch<ExpenseAddPageState>().sending
                          ? null
                          : () async {
                              if (!await networkConnected) {
                                showFloatingSnackBar(context, 'ネットワーク接続がありません。');
                                return;
                              }
                              final result =
                                  await context.read<ExpenseAddPageController>().setExpense();
                              if (!result) {
                                return;
                              }
                              Navigator.pop(context);
                              showFloatingSnackBar(context, '支出を登録しました。');
                            },
                      child: const Text('保存する'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// 選択中の「年月日 (曜) 」の文字列
  String _selectedDateTimeString(int year, int month, int day) {
    return '$year年$month月$day日 (${japaneseWeekDay(year, month, day)})';
  }
}
