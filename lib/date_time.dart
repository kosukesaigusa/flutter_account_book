import 'package:intl/intl.dart';

/// 日本の曜日。
const List<String> japaneseWeekdays = [
  '月',
  '火',
  '水',
  '木',
  '金',
  '土',
  '日',
];

/// 入力月の日数を返す。
int lastDayOfMonth(int year, int month) => DateTime(year, month + 1, 0).day;

extension DateTimeExtension on DateTime {
  /// 「2022-01-01 (月)」のような文字列に変換する
  String toYYYYMMDD({
    String delimiter = '-',
    bool withJapaneseWeekDay = true,
  }) =>
      withJapaneseWeekDay
          ? DateFormat('yyyy${delimiter}MM${delimiter}dd ($japaneseWeekDay)')
              .format(this)
          : DateFormat('yyyy${delimiter}MM${delimiter}dd').format(this);

  /// 「2022-01-01 (月) 00:00」のような文字列に変換する
  String toYYYYMMDDHHMM({
    String delimiter = '-',
    bool withJapaneseWeekDay = true,
  }) =>
      withJapaneseWeekDay
          ? DateFormat(
              'yyyy${delimiter}MM${delimiter}dd ($japaneseWeekDay) HH:mm',
            ).format(this)
          : DateFormat('yyyy${delimiter}MM${delimiter}dd HH:mm').format(this);

  /// 「2022年01月01日 (月) 00:00」のような文字列に変換する
  String toJaYYYYMMDDHHMM({bool withJapaneseWeekDay = true}) =>
      withJapaneseWeekDay
          ? DateFormat('yyyy年MM月dd日 ($japaneseWeekDay) HH:mm').format(this)
          : DateFormat('yyyy年MM月dd日 HH:mm').format(this);

  /// 入力日の日本の曜日を返す
  String get japaneseWeekDay => japaneseWeekdays[_weekDayInt(this) - 1];

  /// 入力日の曜日を整数型で返す
  int _weekDayInt(DateTime dateTime) => dateTime.weekday;
}
