import 'package:flutter/material.dart';
import 'package:flutter_account_book/componentns/calendar/calendart_widget.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarWidget(),
      ],
    );
  }
}
