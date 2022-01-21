import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_account_book/controllers/category_add/category_add_page_controller.dart';
import 'package:flutter_account_book/controllers/category_add/category_add_page_state.dart';
import 'package:flutter_account_book/utils/utils.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:gap/gap.dart';
import 'package:ks_flutter_commons/ks_flutter_commons.dart';
import 'package:provider/provider.dart';

class CategoryAddPage extends StatelessWidget {
  const CategoryAddPage({Key? key}) : super(key: key);

  static const path = '/category-add/';
  static const name = 'CategoryAddPage';

  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<CategoryAddPageController, CategoryAddPageState>(
      create: (_) => CategoryAddPageController(),
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(title: const Text('カテゴリーの追加')),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: context.select<CategoryAddPageController, TextEditingController>(
                    (c) => c.nameTextEditingController),
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
              ),
              const Gap(16),
              TextField(
                controller: context.select<CategoryAddPageController, TextEditingController>(
                    (c) => c.budgetTextEditingController),
                minLines: 1,
                maxLines: 1,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(16),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: '予算',
                ),
              ),
              const Gap(16),
              ElevatedButton(
                onPressed: context.watch<CategoryAddPageState>().sending
                    ? null
                    : () async {
                        if (!await networkConnected) {
                          showFloatingSnackBar(context, 'ネットワーク接続がありません。');
                          return;
                        }
                        final result =
                            await context.read<CategoryAddPageController>().setExpenseCategory();
                        if (!result) {
                          return;
                        }
                        Navigator.pop(context);
                        showFloatingSnackBar(context, '支出を登録しました。');
                      },
                child: const Text('カテゴリーを登録する'),
              ),
            ],
          ),
        );
      },
    );
  }
}
