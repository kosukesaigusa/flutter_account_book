import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_account_book/pages/home/home_page.dart';
import 'package:flutter_account_book/pages/sign_in/sign_in_page.dart';
import 'package:flutter_account_book/view_models/calendar/calendar_view_model.dart';
import 'package:flutter_account_book/view_models/category/category_view_model.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Account Book app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox();
          }
          if (snapshot.hasData) {
            return MultiProvider(
              providers: [
                ChangeNotifierProvider<CalendarViewModel>.value(
                  value: CalendarViewModel(),
                ),
                ChangeNotifierProvider<CategoryViewModel>.value(
                  value: CategoryViewModel(),
                ),
              ],
              child: HomePage(),
            );
          }
          return SignInPage();
        },
      ),
    );
  }
}
