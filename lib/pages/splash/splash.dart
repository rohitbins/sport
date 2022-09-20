import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../service.dart';
import '../../utils/constants.dart';
import '../login/login_page.dart';
import '../router.dart';

class Splash extends StatefulWidget {


  Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();


  @override
  void initState() {
  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    _prefs.then((value){
      CanLogin = value.getBool('CanLogin');
      TakePNPAttendance = value.getBool('takePNPAttendance');
      TakeMemberAttendance= value.getBool('tekeMemberAttendance');
      ShowFee = value.getBool(('ShowFee'))!;
      AcademyLogo = value.getString(('academyLogo'));
      NAME = value.getString(('name'));
      ServiceCall().fetchDashboardData().then((value) => {
      checkpath(context)});
      
    });
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
              if (value.getString('staffKey') != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const MyRoute()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Login()));
      }
    });
  }
}

