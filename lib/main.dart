// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'pages/splash/splash.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

   MyApp({Key? key}) : super(key: key);

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
