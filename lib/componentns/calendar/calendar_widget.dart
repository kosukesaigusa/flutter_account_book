import 'package:flutter/material.dart';
import 'package:flutter_account_book/constatnts/calendar/calendar_constants.dart';
import 'package:flutter_account_book/themes/theme.dart';
import 'package:flutter_account_book/utils/datetime/datetime.dart';
import 'package:flutter_account_book/utils/price/price_formatter.dart';
import 'package:flutter_account_book/view_models/calendar/calendar_view_model.dart';
import 'package:provider/provider.dart';

class CalendarWidget extends StatelessWidget {
  CalendarWidget();
  @override
  Widget build(BuildContext context) {
    return Consumer<CalendarViewModel>(
      builder: (context, vm, child) => Column(
        children: [
          CalendarMonthHandlingWidget(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: weekdayRow,
          ),
          CalendarBody(showEmptyCalendar: !vm.ready),
        ],
      ),
    );
  }

  /// カレンダー上部の月〜日の曜日を表示するウィジェット
  final weekdayRow = List<Widget>.generate(
    7,
    (i) => Expanded(
      child: Container(
        color: grey200,
        child: Center(child: Text('${weekdays[i]}')),
      ),
    ),
  );
}

/// カレンダー上部の年月を表示・操作するウィジェット
class CalendarMonthHandlingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<CalendarViewModel>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back_ios_outlined),
          onPressed: vm.showPreviousMonth,
          iconSize: arrowIconSize,
        ),
        Text('${vm.year}年 ${vm.month}月', style: bold16),
        IconButton(
          icon: const Icon(Icons.arrow_forward_ios_outlined),
          onPressed: vm.showNextMonth,
          iconSize: arrowIconSize,
        ),
      ],
    );
  }
}

/// カレンダーの本体
class CalendarBody extends StatelessWidget {
  const CalendarBody({this.showEmptyCalendar = false});
  final bool showEmptyCalendar;
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<CalendarViewModel>(context);
    final weekDayOfFirstDay = DateTime(vm.year, vm.month, 1).weekday;
    final lastDay = getLastDay(vm.year, vm.month);
    final rowCount = ((weekDayOfFirstDay - 1 + lastDay) / 7).ceil();
    final children = <Widget>[];
    for (var i = 0; i < rowCount; i++) {
      final weekRowChildren = <Widget>[];
      for (var j = 0; j < 7; j++) {
        final number = i * 7 + j + 1 - (weekDayOfFirstDay - 1);
        weekRowChildren.add(CalendarDateCell(
          number: number,
          showEmptyCalendar: showEmptyCalendar,
        ));
      }
      children.add(Row(children: weekRowChildren));
    }
    return Column(children: children);
  }
}

class CalendarDateCell extends StatelessWidget {
  const CalendarDateCell({
    required this.number,
    required this.showEmptyCalendar,
  });
  final int number;
  final bool showEmptyCalendar;
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<CalendarViewModel>(context);
    final lastDay = getLastDay(vm.year, vm.month);
    final isEmptyCell = number < 1 || number > lastDay;
    if (isEmptyCell) {
      return Expanded(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: grey200),
            color: grey50,
          ),
          height: cellHeight,
          child: const SizedBox(),
        ),
      );
    }
    final children = <Widget>[];
    children.add(
      Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: CalendarDateText(number: number, selected: number == vm.day),
      ),
    );
    if (!showEmptyCalendar) {
      children.add(
        const Flexible(
          child: Text(
            '収入',
            style: blue12,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      );
      children.add(
        Flexible(
          child: Text(
            vm.expenseMap[number] == null ? '' : '${priceFormatter.format(vm.expenseMap[number])}',
            style: red12,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      );
    }
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: grey200),
        ),
        height: cellHeight,
        child: InkWell(
          onTap: () {
            vm.onDateCellTapped(number);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          ),
        ),
      ),
    );
  }
}

class CalendarDateText extends StatelessWidget {
  const CalendarDateText({required this.number, required this.selected});
  final int number;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    if (selected) {
      return Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Center(
          child: Text('$number', style: whiteBold12),
        ),
      );
    }
    return Container(
      padding: const EdgeInsets.all(4),
      child: Center(
        child: Text('$number', style: regular12),
      ),
    );
  }
}
