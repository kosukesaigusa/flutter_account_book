import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class CalendarPage extends ConsumerWidget {
  const CalendarPage({super.key});

  static const path = '/calendar';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold();
  }
}
