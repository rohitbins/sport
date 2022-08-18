import 'package:flutter/material.dart';
import 'package:sport/pages/login/login_page.dart';

import 'pages/splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade200,
        primaryColor: Colors.blue.shade900,
      ),
      home: Splash(),
    );
  }
}
