import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../date_time.dart';
import '../../int.dart';
import '../calendar.dart';

/// カレンダー上部の年月を表示・操作するウィジェット。
class SelectedMonth extends ConsumerWidget {
  const SelectedMonth({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDay = ref.watch(selectedDayStateProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () => ref.read(selectedDayStateProvider.notifier).update(
                (state) => SelectedDay(state.year, state.month - 1, 1),
              ),
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.white,
          ),
        ),
        const Gap(16),
        Text(
          '${selectedDay.year}年 ${selectedDay.month}月',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const Gap(16),
        IconButton(
          onPressed: () => ref.read(selectedDayStateProvider.notifier).update(
                (state) => SelectedDay(state.year, state.month + 1, 1),
              ),
          icon: const Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.white,
          ),
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
        const _CalendarBody(),
      ],
    );
  }
}

/// カレンダーの本体。
/// 必要な行数分だけ、7 つの日付セル ([_DayCell]) が含まれた [Row] ウィジェット
/// を [Column] で縦に並べている。
class _CalendarBody extends ConsumerWidget {
  const _CalendarBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDay = ref.watch(selectedDayStateProvider);
    return Column(children: _weekRows(selectedDay.year, selectedDay.month));
  }
}

/// カレンダーの各日付のセル。
class _DayCell extends ConsumerWidget {
  const _DayCell(this.day);

  /// 何日のセルか。
  final int day;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDay = ref.watch(selectedDayStateProvider);
    if (_isEmptyCell(selectedDay.year, selectedDay.month)) {
      return const _EmptyCell();
    }
    return _DayCellContent(day);
  }

  /// そのセルが空っぽであるべきかどうか。
  bool _isEmptyCell(int year, int month) {
    if (day < 1) {
      return true;
    }
    if (day > lastDayOfMonth(year, month)) {
      return true;
    }
    return false;
  }
}

/// 空っぽの日付セル。
class _EmptyCell extends StatelessWidget {
  const _EmptyCell();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[200]!),
          color: Colors.grey[100],
        ),
        height: _dayCellHeight,
      ),
    );
  }
}

/// 空っぽでない日付セルの中身。
class _DayCellContent extends ConsumerWidget {
  const _DayCellContent(this.day);

  /// 何日のセルか。
  final int day;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final monthlyExpensesByDay = ref.watch(monthlyExpensesByDayProvider);
    final expensesOfDay = monthlyExpensesByDay[DayEnum.fromDay(day)] ?? [];
    final dailyTotal = expensesOfDay.fold(
      0,
      (previousValue, element) => previousValue + element.price,
    );
    final isLoading = ref.watch(monthlyExpensesFutureProvider).isLoading;
    return Expanded(
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.grey[200]!)),
        height: _dayCellHeight,
        child: InkWell(
          onTap: () => ref.read(selectedDayStateProvider.notifier).update(
                (state) => SelectedDay(state.year, state.month, day),
              ),
          child: Column(
            children: <Widget>[
              _CalendarDayText(day),
              if (!isLoading && dailyTotal > 0) ...[
                const Gap(4),
                Flexible(
                  child: Text(
                    dailyTotal.withComma,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.red,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// カレンダーの各セルの日付部分。
/// 選択中のときは色付き丸枠で囲まれる。
class _CalendarDayText extends ConsumerWidget {
  const _CalendarDayText(this.day);

  /// 何日のセルか。
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

/// カレンダーのセルの高さ。
const double _dayCellHeight = 80;

/// 指定された月のカレンダーに必要な行数を計算して、そのサイズの数に一致する
/// [Row] を返す。
List<Widget> _weekRows(int year, int month) {
  // 行のリスト（最大 6 行）
  final weekRows = <Widget>[];
  for (var i = 0; i < _rowsCount(year, month); i++) {
    // 1 週間分の各行を構成する [DateCell] のリスト
    final dateCells = <Widget>[];
    for (var j = 0; j < 7; j++) {
      // 1 日以前 32 日以降も取りうるカレンダー上の広い意味での日付
      final day = i * 7 + j + 1 - (_weekDayOfFirstDayInt(year, month) - 1);
      dateCells.add(_DayCell(day));
    }
    weekRows.add(Row(children: dateCells));
  }
  return weekRows;
}

/// 指定された月の 1 日の曜日（の整数値）。
int _weekDayOfFirstDayInt(int year, int month) => DateTime(year, month).weekday;

/// 指定された月のカレンダーの行数を計算する。
int _rowsCount(int year, int month) =>
    ((_weekDayOfFirstDayInt(year, month) - 1 + lastDayOfMonth(year, month)) / 7)
        .ceil();
