import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/constants.dart';
import '../login/login_page.dart';
import '../router.dart';

class Splash extends StatelessWidget {
  Splash({Key? key}) : super(key: key);
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  Widget build(BuildContext context) {
    checkpath(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(splash),
            fit: BoxFit.cover,
          ),
        ),
        child: null,
      ),
    );
  }

  void checkpath(BuildContext context) {
    _prefs.then((value) {
      if (value.getString('customerKey') != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyRoute()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Login()));
      }
    });
  }
}
