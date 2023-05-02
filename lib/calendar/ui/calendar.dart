import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../date_time.dart';
import '../../int.dart';
import '../calendar.dart';

/// カレンダー上部の年月を表示・操作するウィジェット。
class CalendarSelectedMonth extends ConsumerWidget {
  const CalendarSelectedMonth({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDay = ref.watch(selectedDayStateProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () => ref.read(selectedDayStateProvider.notifier).update(
                (state) => SelectedDay(
                  year: state.year,
                  month: state.month - 1,
                  day: 1,
                ),
              ),
          icon: const Icon(Icons.arrow_back_ios_outlined),
        ),
        const Gap(16),
        Text(
          '${selectedDay.year}年 ${selectedDay.month}月',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const Gap(16),
        IconButton(
          onPressed: () => ref.read(selectedDayStateProvider.notifier).update(
                (state) => SelectedDay(
                  year: state.year,
                  month: state.month + 1,
                  day: 1,
                ),
              ),
          icon: const Icon(Icons.arrow_forward_ios_outlined),
        ),
      ],
    );
  }
}

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
                color: Colors.grey[200]!,
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
class CalendarBody extends ConsumerWidget {
  const CalendarBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDay = ref.watch(selectedDayStateProvider);
    final intWeekDayOfFirstDay =
        DateTime(selectedDay.year, selectedDay.month).weekday;
    final rowCount = ((intWeekDayOfFirstDay -
                1 +
                lastDayOfMonth(selectedDay.year, selectedDay.month)) /
            7)
        .ceil();
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

/// カレンダーの各日付のセル。
class CalendarDateCell extends ConsumerWidget {
  const CalendarDateCell({super.key, required this.day});
  final int day;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDay = ref.watch(selectedDayStateProvider);
    // 1 日以前 月の最終日以降では空っぽのセルを表示する
    if (day < 1 || day > lastDayOfMonth(selectedDay.year, selectedDay.month)) {
      return Expanded(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[200]!),
            color: Colors.grey[50],
          ),
          height: 80,
          child: const SizedBox(),
        ),
      );
    }
    return CalendarCellContent(dayEnum: DayEnum.fromDay(day));
  }
}

/// カレンダーの空でない日付の中身
class CalendarCellContent extends ConsumerWidget {
  const CalendarCellContent({super.key, required this.dayEnum});
  final DayEnum dayEnum;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final monthlyExpensesByDay = ref.watch(monthlyExpensesByDayProvider);
    final expensesOfDay = monthlyExpensesByDay[dayEnum] ?? [];
    final dailyTotal = expensesOfDay.fold(
      0,
      (previousValue, element) => previousValue + element.price,
    );
    return Expanded(
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.grey[200]!)),
        height: 80,
        child: InkWell(
          onTap: () => ref.read(selectedDayStateProvider.notifier).update(
                (state) => SelectedDay(
                  year: state.year,
                  month: state.month,
                  day: dayEnum.day,
                ),
              ),
          child: Column(
            children: <Widget>[
              CalendarDateText(day: dayEnum.day),
              const Gap(4),
              Flexible(
                child: Text(
                  dailyTotal > 0 ? dailyTotal.withComma : '-',
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
class CalendarDateText extends ConsumerWidget {
  const CalendarDateText({super.key, required this.day});
  final int day;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDay = ref.watch(selectedDayStateProvider);
    final selected = day == selectedDay.day;
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: selected
          ? BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.primary,
            )
          : null,
      child: Center(
        child: Text(
          '$day',
          style: TextStyle(
            fontSize: 12,
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            color: selected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
