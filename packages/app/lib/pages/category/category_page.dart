import 'package:flutter/material.dart';
import 'package:flutter_account_book/themes/theme.dart';
import 'package:flutter_account_book/utils/utils.dart';
import 'package:flutter_account_book/view_models/category/category_view_model.dart';
import 'package:gap/gap.dart';
import 'package:ks_flutter_commons/ks_flutter_commons.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  static const path = '/category/';
  static const name = 'CategoryPage';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: Consumer<CategoryViewModel>(
          builder: (context, vm, child) {
            return RefreshIndicator(
              onRefresh: () async {
                // await CategoryViewModel().fetchCategories();
                // await context.read<CategoryController>().fetch();
              },
              child: ReorderableListView.builder(
                itemBuilder: (context, index) {
                  final expenseCategory = vm.expenseCategories[index];
                  return ListTile(
                    key: Key(expenseCategory.reference!.id),
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(
                            expenseCategory.name,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Gap(32),
                        Text(
                          '${toJpy(expenseCategory.budget)}',
                          style: bold,
                        ),
                      ],
                    ),
                    trailing: const Icon(Icons.menu),
                  );
                },
                itemCount: vm.expenseCategories.length,
                onReorder: (oldIndex, newIndex) async {
                  final batch = db.batch();
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  vm.expenseCategories.insert(newIndex, vm.expenseCategories.removeAt(oldIndex));
                  for (var i = 0; i < vm.expenseCategories.length; i++) {
                    batch.update(
                      vm.expenseCategories[i].reference!,
                      <String, dynamic>{'order': i + 100},
                    );
                  }
                  try {
                    await batch.commit();
                    // ignore: avoid_catches_without_on_clauses
                  } catch (_) {
                    showFloatingSnackBar(context, 'エラーが発生しました。');
                  }
                },
              ),
            );
          },
        ),
      );
}
