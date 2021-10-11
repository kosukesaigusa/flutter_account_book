import 'package:flutter/material.dart';
import 'package:flutter_account_book/utils/price/price_formatter.dart';
import 'package:flutter_account_book/view_models/category/category_view_model.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryViewModel>(
      builder: (context, vm, child) {
        return Padding(
          padding: const EdgeInsets.only(top: 16),
          child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            itemCount: vm.expenseCategories.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Text(vm.expenseCategories[index].name),
                  Text('${priceFormatter.format(vm.expenseCategories[index].budget)} 円'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
