import 'package:flutter/material.dart';
import 'package:flutter_account_book/controllers/category/category_page_controller.dart';
import 'package:flutter_account_book/controllers/category/category_page_state.dart';
import 'package:flutter_account_book/themes/theme.dart';
import 'package:gap/gap.dart';
import 'package:ks_flutter_commons/ks_flutter_commons.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  static const path = '/category/';
  static const name = 'CategoryPage';

  @override
  Widget build(BuildContext context) {
    final expenseCategories = context.watch<CategoryPageState>().expenseCategories;
    return Scaffold(
      appBar: AppBar(title: const Text('カテゴリー')),
      body: RefreshIndicator(
        onRefresh: () async {
          await context.read<CategoryPageController>().fetch();
        },
        child: ReorderableListView.builder(
          itemCount: expenseCategories.length,
          itemBuilder: (context, index) {
            final expenseCategory = expenseCategories[index];
            return ListTile(
              key: Key(expenseCategory.expenseCategoryId),
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
          onReorder: (oldIndex, newIndex) async {
            await context
                .read<CategoryPageController>()
                .reorderExpenseCategories(oldIndex: oldIndex, newIndex: newIndex);
          },
        ),
      ),
    );
  }
}
