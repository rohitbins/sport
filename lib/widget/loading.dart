import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key, this.navigateTo}) : super(key: key);
  final String? navigateTo;
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 0), () {});
    // Navigator.pushNamed(context, widget.navigateTo ?? '/c');
    Navigator.pushNamedAndRemoveUntil(context, "/c", (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(6, 41, 74, 1),
      body: Center(
        child: SpinKitRing(
          duration: Duration(seconds: 0),
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
