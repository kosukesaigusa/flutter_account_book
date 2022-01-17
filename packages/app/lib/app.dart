import 'package:flutter/material.dart';
import 'package:flutter_account_book/constatnts/localization/localization.dart';
import 'package:flutter_account_book/scaffold_messenger_navigator.dart';

/// MaterialApp を返すウィジェット。
/// ここではルートは制御せず、home プロパティに
/// ScaffoldMessengerNavigator を指定するだけとする。
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: UniqueKey(),
      debugShowCheckedModeBanner: false,
      locale: locale,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: const [locale],
      title: 'NPO MOTTAI:',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ScaffoldMessengerNavigator(),
    );
  }
}
