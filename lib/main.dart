import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport/utils/constants.dart';

import 'pages/splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        drawerTheme: DrawerThemeData(backgroundColor: Colors.blueGrey.shade100),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(6, 41, 74, 1),
        ),
        scaffoldBackgroundColor: Colors.grey.shade200,
        primaryColor: const Color.fromRGBO(6, 41, 74, 1),
      ),
      home: Splash(),
    );
  }
}
