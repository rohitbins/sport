import 'package:flutter/material.dart';
import 'pages/splash/splash.dart';
import 'dart:io' show Platform;

void main() {
  String os = Platform.operatingSystem;
  if(Platform.isAndroid){
    print("is a android");
  }else if (Platform.isIOS){
    print("is a ios");
  }
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
