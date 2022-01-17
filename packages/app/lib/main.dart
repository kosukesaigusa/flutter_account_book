import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_account_book/app.dart';
import 'package:flutter_account_book/app_multi_provider.dart';
import 'package:ks_flutter_commons/ks_flutter_commons.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const RootWidget(
      child: AppMultiProvider(
        child: App(),
      ),
    ),
  );
}
