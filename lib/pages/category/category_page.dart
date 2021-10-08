import 'package:flutter/material.dart';
import 'package:flutter_account_book/componentns/util_components/centered_spinkit_circle.dart';
import 'package:flutter_account_book/firestore/firestore_service.dart';
import 'package:flutter_account_book/models/expense_category/expense_category.dart';
import 'package:flutter_account_book/utils/price/price_formatter.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ExpenseCategory>>(
      stream: categorySteam(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CenteredSpinkitCircle();
        }
        if (!snapshot.hasData) {
          return const SizedBox();
        }
        final categories = snapshot.data!;
        return Padding(
          padding: const EdgeInsets.only(top: 16),
          child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            itemCount: categories.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Text(categories[index].name),
                  Text('${priceFormatter.format(categories[index].budget)} 円'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
