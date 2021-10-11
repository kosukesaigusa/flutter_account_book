import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_account_book/constatnts/calendar/calendar_constants.dart';
import 'package:flutter_account_book/constatnts/expense_add/constants.dart';
import 'package:flutter_account_book/firestore/firestore_path.dart';
import 'package:flutter_account_book/firestore/firestore_service.dart';
import 'package:flutter_account_book/models/expense/expense.dart';
import 'package:flutter_account_book/store/store.dart';
import 'package:flutter_account_book/themes/theme.dart';
import 'package:flutter_account_book/utils/datetime/datetime.dart';
import 'package:flutter_account_book/utils/utility_methods.dart';
import 'package:flutter_account_book/view_models/expense_or_income_add/expense_add_page_view_model.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class ExpenseAddPage extends StatelessWidget {
  final store = Store();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('支出の登録')),
      body: SafeArea(
        child: ChangeNotifierProvider<ExpenseAddPageViewModel>(
          create: (_) => ExpenseAddPageViewModel()..init(),
          child: Consumer<ExpenseAddPageViewModel>(
            builder: (context, vm, child) {
              return Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: vm.showPreviousDay,
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
                          child: Text('${vm.year}年${vm.month}月${vm.day}(${getJapaneseWeekday(
                            vm.year,
                            vm.month,
                            vm.day,
                          )})'),
                        ),
                        const Gap(16),
                        InkWell(
                          onTap: vm.showNextDay,
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
                          child: TextFormField(
                            minLines: 1,
                            maxLines: 1,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              isDense: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(),
                              ),
                              hintText: 'メモ',
                            ),
                            onChanged: vm.changeName,
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
                          child: TextFormField(
                            minLines: 1,
                            maxLines: 1,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              isDense: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(),
                              ),
                              hintText: '支出（円）',
                            ),
                            onChanged: vm.changePrice,
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
                            vm.categories.length,
                            (index) => InkWell(
                              onTap: () {
                                vm.selectCategory(index);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: vm.selectedCategoryIndex == index
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
                                        '${vm.categories[index].name}',
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
                        onPressed: vm.validate()
                            ? () async {
                                if (!await networkConnected) {
                                  showFloatingSnackBar(context, 'ネットワーク接続がありません。');
                                  return;
                                }
                                final category = vm.categories[vm.selectedCategoryIndex];
                                final ref = category.reference;
                                if (ref == null) {
                                  showFloatingSnackBar(context, 'エラーが発生しました。');
                                  return;
                                }
                                final expense = Expense(
                                  name: vm.name,
                                  price: vm.price!,
                                  expenseCategoryRef: ref,
                                );
                                await setData(
                                  docRef: FirestorePath.expenseCollectionRef.doc(store.uuid),
                                  data: <String, dynamic>{
                                    ...expense.toJson(),
                                    'paidAt': DateTime(vm.year, vm.month, vm.day),
                                    'createdAt': FieldValue.serverTimestamp(),
                                    'updatedAt': FieldValue.serverTimestamp(),
                                  },
                                );
                                Navigator.pop(context);
                              }
                            : null,
                        child: const Text('支出を登録する'),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
