import 'package:flutter/material.dart';
import 'package:flutter_account_book/constatnts/calendar/calendar_constants.dart';
import 'package:flutter_account_book/themes/theme.dart';
import 'package:flutter_account_book/view_models/calendar/calendar_view_model.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

/// カレンダー上部の年月を表示・操作するウィジェット
class CalendarMonthHandlingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<CalendarViewModel>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: vm.showPreviousMonth,
          child: const Icon(
            Icons.arrow_back_ios_outlined,
            size: arrowIconSize,
          ),
        ),
        const Gap(16),
        Text('${vm.year}年 ${vm.month}月', style: bold16),
        const Gap(16),
        InkWell(
          onTap: vm.showNextMonth,
          child: const Icon(
            Icons.arrow_forward_ios_outlined,
            size: arrowIconSize,
          ),
        ),
      ],
    );
  }
}
