import 'package:flutter/material.dart';
import 'package:flutter_account_book/themes/theme.dart';
import 'package:flutter_account_book/utils/price/price_formatter.dart';
import 'package:flutter_account_book/view_models/calendar/calendar_view_model.dart';
import 'package:provider/provider.dart';

class ExpenseIncomeTotalWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CalendarViewModel>(
      builder: (context, vm, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Row(
            children: [
              Column(
                children: [
                  Text('固定費', style: grey12),
                  Text(vm.ready ? '${priceFormatter.format(vm.totalFixedFeePrice)} 円' : '-'),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Text('変動費', style: grey12),
                  Text(
                    vm.ready ? '${priceFormatter.format(vm.totalExpensePrice)} 円' : '-',
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Text('支出計', style: grey12),
                  Text(
                    vm.ready
                        ? '${priceFormatter.format(vm.totalFixedFeePrice + vm.totalExpensePrice)} 円'
                        : '-',
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Text('収入計', style: grey12),
                  Text(
                    vm.ready ? '${priceFormatter.format(vm.totalIncomePrice)} 円' : '',
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
