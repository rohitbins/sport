import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/constants.dart';
import '../login/login_page.dart';
import '../router.dart';

class Splash extends StatefulWidget {


 const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();


  @override
  void initState() {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    _prefs.then((value){
      TakePNPAttendance = value.getBool('takePNPAttendance');
      TakeMemberAttendance= value.getBool('tekeMemberAttendance');
      // CanLogin = value.getBool('canLogin');
      ShowFee = value.getBool(("fees"))!;
    });
    super.initState();
  }
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
// iIbakR80ZzmJo8mnRsd8vNN3LOjt1C/FQ7A2kbD1flA=
// iIbakR80ZzmJo8mnRsd8vNN3LOjt1C/FQ7A2kbD1flA=

