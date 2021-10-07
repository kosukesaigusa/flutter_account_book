import 'package:flutter/material.dart';

Future<void> pushPage({
  required BuildContext context,
  required Widget page,
}) async {
  await Navigator.of(context).push<void>(
    MaterialPageRoute(
      builder: (context) {
        return page;
      },
    ),
  );
}
