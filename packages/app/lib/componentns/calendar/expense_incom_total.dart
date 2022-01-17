import 'package:flutter/material.dart';
import 'package:flutter_account_book/themes/theme.dart';
import 'package:flutter_account_book/view_models/calendar/calendar_view_model.dart';
import 'package:ks_flutter_commons/ks_flutter_commons.dart';
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
                  Text(vm.ready ? '${toJpy(vm.totalFixedFeePrice)}' : '-'),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Text('変動費', style: grey12),
                  Text(
                    vm.ready ? '${toJpy(vm.totalExpensePrice)}' : '-',
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Text('支出計', style: grey12),
                  Text(
                    vm.ready ? '${toJpy(vm.totalFixedFeePrice + vm.totalExpensePrice)}' : '-',
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Text('収入計', style: grey12),
                  Text(
                    vm.ready ? '${toJpy(vm.totalIncomePrice)}' : '',
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
