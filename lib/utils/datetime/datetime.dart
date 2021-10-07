/// 曜日（日本語）
const List<String> weekdays = [
  '月',
  '火',
  '水',
  '木',
  '金',
  '土',
  '日',
];

/// 月, 火, 水, ..., or 日 を返す
String getJapaneseWeekday(int year, int month, int day) =>
    weekdays[getIntWeekDay(year, month, day) - 1];

/// 入力月の日数を返す
int getLastDay(int year, int month) => DateTime(year, month + 1, 0).day;

/// 入力日の曜日を整数型で返す
int getIntWeekDay(int year, int month, int day) => DateTime(year, month, day).weekday;
