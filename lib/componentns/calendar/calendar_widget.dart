import 'package:flutter/material.dart';
import 'package:flutter_account_book/constatnts/calendar/calendar_constants.dart';
import 'package:flutter_account_book/controllers/calendar/calendar_page_controller.dart';
import 'package:flutter_account_book/controllers/calendar/calendar_page_state.dart';
import 'package:flutter_account_book/themes/theme.dart';
import 'package:gap/gap.dart';
import 'package:ks_flutter_commons/ks_flutter_commons.dart';
import 'package:provider/provider.dart';

/// カレンダーの全体
class CalendarWidget extends StatelessWidget {
  const CalendarWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 冒頭のグレーの週部分
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List<Widget>.generate(
            7,
            (i) => Expanded(
              child: Container(
                color: grey200,
                child: Center(child: Text('${japaneseWeekdays[i]}')),
              ),
            ),
          ),
        ),
        // カレンダーの本体
        const CalendarBody(),
      ],
    );
  }
}

/// カレンダーの本体
class CalendarBody extends StatelessWidget {
  const CalendarBody();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CalendarPageState>();
    final intWeekDayOfFirstDay = DateTime(state.year, state.month, 1).weekday;
    final rowCount =
        ((intWeekDayOfFirstDay - 1 + lastDayOfMonth(state.year, state.month)) / 7).ceil();
    // 行のリスト（最大 6 行）
    final weekRows = <Widget>[];
    for (var i = 0; i < rowCount; i++) {
      // 1 週間分の各行を構成する DateCell のリスト
      final dateCells = <Widget>[];
      for (var j = 0; j < 7; j++) {
        // 1 日以前 32 日以降も取りうるカレンダー上の広い意味での日付
        final day = i * 7 + j + 1 - (intWeekDayOfFirstDay - 1);
        dateCells.add(CalendarDateCell(day: day));
      }
      weekRows.add(Row(children: dateCells));
    }
    return Column(children: weekRows);
  }
}

/// カレンダーの各日付のセル
class CalendarDateCell extends StatelessWidget {
  const CalendarDateCell({required this.day});
  final int day;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CalendarPageState>();
    // 1 日以前 月の最終日以降では空っぽのセルを表示する
    if (day < 1 || day > lastDayOfMonth(state.year, state.month)) {
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
    return CalendarCellContent(day: day);
  }
}

/// カレンダーの空でない日付の中身
class CalendarCellContent extends StatelessWidget {
  const CalendarCellContent({required this.day});
  final int day;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: grey200),
        ),
        height: cellHeight,
        child: InkWell(
          onTap: () {
            context.read<CalendarPageController>().onCalendarCellTapped(day);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CalendarDateText(day: day),
              const Gap(4),
              if (!context.watch<CalendarPageState>().loading) Flexible(child: _buildIncomeText(0)),
              if (!context.watch<CalendarPageState>().loading)
                Flexible(
                  child: _buildExpenseText(
                      context.watch<CalendarPageState>().dailySummaries[day - 1].totalExpense),
                ),
            ],
          ),
        ),
      ),
    );
  }

  /// その日の総収入の青文字
  Widget _buildIncomeText(int number) {
    return number > 0
        ? Text(
            '${addComma(number)}',
            style: blue12,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          )
        : const SizedBox();
  }

  /// その日の総支出の赤文字
  Widget _buildExpenseText(int number) {
    return Text(
      number > 0 ? '${addComma(number)}' : '-',
      style: red12,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
}

/// カレンダーの各セルの日付部分。
/// 選択中のときは色付き丸枠で囲まれる。
class CalendarDateText extends StatelessWidget {
  const CalendarDateText({required this.day});
  final int day;

  @override
  Widget build(BuildContext context) {
    final selected = day == context.watch<CalendarPageState>().day;
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: selected
          ? BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).colorScheme.primary)
          : null,
      child: Center(
        child: Text('$day', style: selected ? whiteBold12 : regular12),
      ),
    );
  }
}
