import 'package:flutter/material.dart';


class MyAttendance extends StatefulWidget {
  const MyAttendance({Key? key}) : super(key: key);

  @override
  State<MyAttendance> createState() => _MyAttendanceState();
}

class _MyAttendanceState extends State<MyAttendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Attendance",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16
        ),),
        centerTitle: true,
      ),
    );
  }
}