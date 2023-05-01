import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../auth/auth.dart';
import '../../router/router.dart';
import '../../router/router.gr.dart';

@RoutePage()
class CalendarPage extends ConsumerWidget {
  const CalendarPage({super.key});

  static const path = '/calendar';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text(ref.watch(userIdProvider).value ?? 'ログインしていません。'),
            ),
            ListTile(
              title: const Text('サインアウト'),
              onTap: () async {
                await ref.read(signOutProvider).call();
                await ref
                    .read(appRouterProvider)
                    .replaceAll([const SignInRoute()]);
              },
            ),
            // 他のリストアイテムをここに追加できます
          ],
        ),
      ),
    );
  }
}
