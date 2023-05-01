import 'package:flutter/material.dart';
import 'package:flutter_account_book/constatnts/calendar/calendar_constants.dart';
import 'package:flutter_account_book/controllers/calendar/calendar_page_controller.dart';
import 'package:flutter_account_book/controllers/calendar/calendar_page_state.dart';
import 'package:flutter_account_book/themes/theme.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

/// カレンダー上部の年月を表示・操作するウィジェット
class CalendarMonthHandlingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = context.read<CalendarPageController>();
    final state = context.watch<CalendarPageState>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: controller.showPreviousMonth,
          child: const Icon(
            Icons.arrow_back_ios_outlined,
            size: arrowIconSize,
          ),
        ),
        const Gap(16),
        Text('${state.year}年 ${state.month}月', style: bold16),
        const Gap(16),
        InkWell(
          onTap: controller.showNextMonth,
          child: const Icon(
            Icons.arrow_forward_ios_outlined,
            size: arrowIconSize,
          ),
        ),
      ],
    );
  }
}
