import 'package:flutter/material.dart';

class MyPayment extends StatefulWidget {
  const MyPayment({Key? key}) : super(key: key);

  @override
  State<MyPayment> createState() => _MyPaymentState();
}

class _MyPaymentState extends State<MyPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Payment",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15
        ),),
        centerTitle: true,
      ),
    );
  }
}