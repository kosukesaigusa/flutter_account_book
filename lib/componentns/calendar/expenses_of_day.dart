import 'package:flutter/material.dart';
import 'package:flutter_account_book/themes/theme.dart';
import 'package:flutter_account_book/utils/price/price_formatter.dart';
import 'package:flutter_account_book/utils/utility_methods.dart';
import 'package:flutter_account_book/view_models/calendar/calendar_view_model.dart';
import 'package:provider/provider.dart';

class ExpensesOfDaySliverList extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Consumer<CalendarViewModel>(
        builder: (context, vm, child) {
          final count = vm.expensesOfDay.length;
          if (count == 0) {
            return SliverList(
              delegate: SliverChildListDelegate([
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('支出はありません。'),
                ),
              ]),
            );
          }
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: EdgeInsets.only(top: index == 0 ? 16 : 0),
                  child: InkWell(
                    onTap: () {
                      showFloatingSnackBar(context, 'まだ何も起こりません。');
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      child: Expanded(
                        child: Row(
                          children: [
                            Expanded(child: Text(vm.expensesOfDay[index].name)),
                            Text(
                              '${priceFormatter.format(vm.expensesOfDay[index].price)} 円',
                              style: bold,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              childCount: count,
            ),
          );
        },
      );
}
