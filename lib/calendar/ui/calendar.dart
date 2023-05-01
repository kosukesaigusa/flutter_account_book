import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../date_time.dart';
import '../../int.dart';

///
final _grey200 = Colors.grey[200]!;

///
final _grey50 = Colors.grey[50]!;

///
double _cellHeight = 80;

/// 上部の曜日の表示を含むカレンダー全体。
class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List<Widget>.generate(
            7,
            (i) => Expanded(
              child: ColoredBox(
                color: _grey200,
                child: Center(child: Text(japaneseWeekdays[i])),
              ),
            ),
          ),
        ),
        const CalendarBody(),
      ],
    );
  }
}

/// カレンダーの本体。
class CalendarBody extends StatelessWidget {
  const CalendarBody({super.key});

  @override
  Widget build(BuildContext context) {
    // final intWeekDayOfFirstDay = DateTime(state.year, state.month).weekday;
    final intWeekDayOfFirstDay = DateTime(2023, 5).weekday;
    // final rowCount =
    //     ((intWeekDayOfFirstDay - 1 + lastDayOfMonth(state.year, state.month)) /
    //             7)
    //         .ceil();
    final rowCount =
        ((intWeekDayOfFirstDay - 1 + lastDayOfMonth(2023, 5)) / 7).ceil();
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
  const CalendarDateCell({super.key, required this.day});
  final int day;

  @override
  Widget build(BuildContext context) {
    // 1 日以前 月の最終日以降では空っぽのセルを表示する
    if (day < 1 || day > lastDayOfMonth(2023, 5)) {
      return Expanded(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: _grey200),
            color: _grey50,
          ),
          height: _cellHeight,
          child: const SizedBox(),
        ),
      );
    }
    return CalendarCellContent(day: day);
  }
}

/// カレンダーの空でない日付の中身
class CalendarCellContent extends StatelessWidget {
  const CalendarCellContent({super.key, required this.day});
  final int day;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: _grey200),
        ),
        height: _cellHeight,
        child: InkWell(
          onTap: () {
            // context.read<CalendarPageController>().onCalendarCellTapped(day);
          },
          child: Column(
            children: <Widget>[
              CalendarDateText(day: day),
              const Gap(4),
              Flexible(
                child: Text(
                  1000 > 0 ? 1000.withComma : '-',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.red,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// カレンダーの各セルの日付部分。
/// 選択中のときは色付き丸枠で囲まれる。
class CalendarDateText extends StatelessWidget {
  const CalendarDateText({super.key, required this.day});
  final int day;

  @override
  Widget build(BuildContext context) {
    // final selected = day == context.watch<CalendarPageState>().day;
    const selected = false;
    return Container(
      padding: const EdgeInsets.all(4),
      child: Center(
        child: Text(
          '$day',
          style: const TextStyle(
            fontSize: 12,
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            color: selected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
