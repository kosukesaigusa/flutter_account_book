import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_account_book/app.dart';
import 'package:flutter_account_book/app_multi_provider.dart';
import 'package:flutter_account_book/store/store.dart';
import 'package:ks_flutter_commons/ks_flutter_commons.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final store = Store();
  runApp(
    RootWidget(
      child: AppMultiProvider(
        child: ChangeNotifierProvider<Store>.value(
          value: store,
          builder: (context, child) => const App(),
        ),
      ),
    ),
  );
}
