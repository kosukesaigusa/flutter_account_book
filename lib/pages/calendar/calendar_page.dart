import 'package:flutter/material.dart';
import 'package:flutter_account_book/componentns/calendar/calendar_widget.dart';
import 'package:flutter_account_book/componentns/calendar/expenses_of_day.dart';
import 'package:flutter_account_book/componentns/calendar/header_month_handler.dart';
import 'package:flutter_account_book/view_models/calendar/calendar_view_model.dart';
import 'package:provider/provider.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Column(
    //   children: [
    //     CalendarWidget(),
    //   ],
    // );
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CalendarMonthHandlingWidget(),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            CalendarWidget(),
          ]),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Consumer<CalendarViewModel>(
                builder: (context, vm, child) {
                  return Container(
                    padding: const EdgeInsets.all(16),
                    child: Text('Row_$index'),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
