import 'package:flutter/material.dart';
import 'package:flutter_account_book/componentns/calendar/calendar_widget.dart';
import 'package:flutter_account_book/componentns/calendar/expense_incom_total.dart';
import 'package:flutter_account_book/componentns/calendar/expenses_of_day.dart';
import 'package:flutter_account_book/componentns/calendar/header_month_handler.dart';
import 'package:flutter_account_book/controllers/calendar/calendar_page_controller.dart';
import 'package:flutter_account_book/controllers/calendar/calendar_page_state.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  static const path = '/calendar/';
  static const name = 'CalendarPage';

  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<CalendarPageController, CalendarPageState>(
      create: (_) => CalendarPageController(),
      builder: (context, _) {
        return RefreshIndicator(
          onRefresh: () async {
            await context.read<CalendarPageController>().fetchExpenses();
          },
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                flexibleSpace: FlexibleSpaceBar(
                  title: CalendarMonthHandlingWidget(),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  // カレンダー上部の該当月支出・収入などのサマリー
                  ExpenseIncomeTotalWidget(),
                  // カレンダー
                  const CalendarWidget(),
                ]),
              ),
              ExpensesOfDaySliverList(),
            ],
          ),
        );
      },
    );
  }
}
