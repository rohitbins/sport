import 'package:flutter/material.dart';

import '../widget/attendance_card.dart';
import '../widget/sportPie.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  Map<String, double> attendanceList = {"In": 15, "Out": 85};
  Map<String, double> fee = {"Paid": 75.8, "pending": 85};
  final String attendanceText = 'Attendance';
  final String feeText = 'Fee';
  List<Color> colorList = [Colors.green, Colors.orange];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(4),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              attendanceText,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 2.0),
              height: 90.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  AttendanceCard(ampm: 'pm', end: '9:00', start: '8:00'),
                  AttendanceCard(ampm: 'pm', end: '8:00', start: '7:00'),
                  AttendanceCard(ampm: 'pm', end: '10:00', start: '9:00'),
                  AttendanceCard(ampm: 'pm', end: '11:00', start: '10:00'),
                  AttendanceCard(ampm: 'pm', end: '12:00', start: '11:00'),
                  AttendanceCard(ampm: 'am', end: '18:00', start: '17:00'),
                  AttendanceCard(ampm: 'am', end: '19:00', start: '18:00'),
                  AttendanceCard(ampm: 'am', end: '20:00', start: '19:00'),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    feeText,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SportPie(colorList: colorList, dataSet: fee),
                  Text(
                    attendanceText,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SportPie(colorList: colorList, dataSet: attendanceList),
                ]),
          ]),
        ),
      ),
    );
  }
}
