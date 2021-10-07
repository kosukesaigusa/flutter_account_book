import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
      appBar: AppBar(title: const Text('支出の追加')),
      body: ChangeNotifierProvider<ExpenseAddPageViewModel>(
        create: (_) => ExpenseAddPageViewModel()..init(),
        child: Consumer<ExpenseAddPageViewModel>(
          builder: (context, vm, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          vm.showPreviousDay();
                        },
                        icon: const Icon(Icons.arrow_back_ios_outlined),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text('${vm.year}年${vm.month}月${vm.day}(${getJapaneseWeekday(
                          vm.year,
                          vm.month,
                          vm.day,
                        )})'),
                      ),
                      IconButton(
                        onPressed: () {
                          vm.showNextDay();
                        },
                        icon: const Icon(Icons.arrow_forward_ios_outlined),
                      ),
                    ],
                  ),
                  TextFormField(
                    minLines: 1,
                    maxLines: 1,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(16),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: 'メモ',
                    ),
                    onChanged: vm.changeName,
                  ),
                  const Gap(16),
                  TextFormField(
                    minLines: 1,
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(16),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: '支出（円）',
                    ),
                    onChanged: vm.changePrice,
                  ),
                  const Gap(16),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Wrap(
                      spacing: 16,
                      runSpacing: 16,
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
                                children: [
                                  Text('${vm.categories[index].name}'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(16),
                  ElevatedButton(
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
                              categoryRef: ref,
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
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
