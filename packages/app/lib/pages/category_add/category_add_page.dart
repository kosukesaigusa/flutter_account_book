import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_account_book/firestore/firestore_path.dart';
import 'package:flutter_account_book/firestore/firestore_service.dart';
import 'package:flutter_account_book/models/v1/expense_category/expense_category.dart';
import 'package:flutter_account_book/utils/utils.dart';
import 'package:flutter_account_book/view_models/category_add/category_add_page_view_model.dart';
import 'package:gap/gap.dart';
import 'package:ks_flutter_commons/ks_flutter_commons.dart';
import 'package:provider/provider.dart';

class CategoryAddPage extends StatelessWidget {
  const CategoryAddPage({Key? key}) : super(key: key);

  static const path = '/category-add/';
  static const name = 'CategoryAddPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('カテゴリーの追加')),
      body: ChangeNotifierProvider<CategoryAddPageViewModel>(
        create: (_) => CategoryAddPageViewModel(),
        child: Consumer<CategoryAddPageViewModel>(
          builder: (context, vm, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                    hintText: 'カテゴリー名',
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
                    hintText: '予算',
                  ),
                  onChanged: vm.changeBudget,
                ),
                const Gap(16),
                ElevatedButton(
                  onPressed: vm.validate()
                      ? () async {
                          if (!await networkConnected) {
                            showFloatingSnackBar(context, 'ネットワーク接続がありません。');
                            return;
                          }
                          final expenseCategory =
                              ExpenseCategory(name: vm.name, budget: vm.budget!);
                          await setData(
                            docRef: FirestorePath.expenseCateogoryCollectionRef.doc(uuid),
                            data: <String, dynamic>{
                              ...expenseCategory.toJson(),
                              'createdAt': FieldValue.serverTimestamp(),
                              'updatedAt': FieldValue.serverTimestamp(),
                            },
                          );
                          Navigator.pop(context);
                        }
                      : null,
                  child: const Text('カテゴリーを登録する'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
