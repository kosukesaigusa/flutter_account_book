import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../firestore/models/expense.dart';
import '../firestore/repositories/expense_repository.dart';

/// カレンダー上で選択中の年・月・日を表すクラス。
@immutable
class SelectedDay {
  const SelectedDay(this.year, this.month, this.day);

  final int year;
  final int month;
  final int day;
}

/// カレンダー上で選択中の年・月・日を管理する。
final selectedDayStateProvider = StateProvider<SelectedDay>((_) {
  final now = DateTime.now();
  return SelectedDay(now.year, now.month, now.day);
});

/// Firestore から取得される、選択中の支出一覧を取得・保持する。
final monthlyExpensesFutureProvider =
    FutureProvider.autoDispose<List<Expense>>((ref) async {
  final selectedDay = ref.watch(selectedDayStateProvider);
  final year = selectedDay.year;
  final month = selectedDay.month;
  final expenses = await ref
      .read(expenseRepositoryProvider)
      .fetchExpenses(year: year, month: month);
  return expenses;
});

/// Firestore から取得される、選択中の支出一覧の値を保持する。
/// 値がなければ空配列を返す。
final monthlyExpensesProvider = Provider.autoDispose<List<Expense>>((ref) {
  return ref.watch(monthlyExpensesFutureProvider).value ?? [];
});

/// 選択中の月の日ごとの支出一覧。
final monthlyExpensesByDayProvider =
    Provider.autoDispose<Map<DayEnum, List<Expense>>>((ref) {
  final expenses = ref.watch(monthlyExpensesProvider);
  final map =
      DayEnum.values.asMap().map((_, value) => MapEntry(value, <Expense>[]));
  for (final expense in expenses) {
    final day = expense.paidAt.dateTime?.day;
    if (day == null) {
      continue;
    }
    (map[DayEnum.fromDay(day)] ??= []).add(expense);
  }
  return map;
});

/// 選択中の月の支出（変動費）の合計金額。
final monthlyTotalExpenseProvider = Provider.autoDispose<int>((ref) {
  final expenses = ref.watch(monthlyExpensesProvider);
  return expenses.fold(
    0,
    (previousValue, element) => previousValue + element.price,
  );
});

/// 選択中の月の支出（固定費）の合計金額。
// TODO: 固定費のモデリング・実装方法を考える
final monthlyTotalFixedFeeProvider = Provider.autoDispose<int>((_) => 150000);

enum DayEnum {
  first(1),
  second(2),
  third(3),
  fourth(4),
  fifth(5),
  sixth(6),
  seventh(7),
  eighth(8),
  ninth(9),
  tenth(10),
  eleventh(11),
  twelfth(12),
  thirteenth(13),
  fourteenth(14),
  fifteenth(15),
  sixteenth(16),
  seventeenth(17),
  eighteenth(18),
  nineteenth(19),
  twentieth(20),
  twentyFirst(21),
  twentySecond(22),
  twentyThird(23),
  twentyFourth(24),
  twentyFifth(25),
  twentySixth(26),
  twentySeventh(27),
  twentyEighth(28),
  twentyNinth(29),
  thirtieth(30),
  thirtyFirst(31),
  ;

  const DayEnum(this.day);

  final int day;

  static DayEnum fromDay(int day) {
    // TODO: firstWhereOrNull にする方が無難かも。
    return DayEnum.values.firstWhere((element) => element.day == day);
  }
}
