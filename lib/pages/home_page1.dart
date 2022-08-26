import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport/pages/my_attendance.dart';
import '../widget/attendance_card.dart';
import '../widget/sportPie.dart';
import 'login/login_page.dart';

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
  String userName = '';
  List<Color> colorList = [Colors.green, Colors.orange];
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var MenuItem = <String>['My Attendance', 'Logout'];
  void onSelected(item) {
    switch (item) {
      case 'My Attendance':
        {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyAttendance(),
              ));
        }
        break;

        case 'Logout':
        {
          _prefs.then((value) {
            value.clear();
          });
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const Login()));
        }
        break;
    }
  }

  @override
  void initState() {
    getName();
    super.initState();
  }

  getName() async {
    await _prefs.then((value) {
      setState(() {
        userName = value.getString(('name'))!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          userName,
          style: const TextStyle(fontSize: 12),
        ),
        actions: [
          PopupMenuButton<String>(
              onSelected: onSelected,
              itemBuilder: (BuildContext context) {
                return MenuItem.map((String choice) {
                  return PopupMenuItem<String>(
                      // ignore: sort_child_properties_last
                      child: Text(choice), value: choice);
                }).toList();
              })
        ],
      ),
        body: const Center(
          child:  Text("Coming Soon",
        style: TextStyle(
        fontSize: 30,
        color: Colors.white,
        shadows: [
          BoxShadow(
            color:  Colors.black,
            offset: Offset(0,0),
            blurRadius: 50
          )
        ]
         ),
        ),
        ),
             );
  }
}




 // Text(
            //   attendanceText,
            //   style: const TextStyle(fontWeight: FontWeight.w600),
            // ),
            // Container(
            //   margin: const EdgeInsets.symmetric(vertical: 2.0),
            //   height: 90.0,
            //   child: ListView(
            //     scrollDirection: Axis.horizontal,
            //     children: <Widget>[
            //       AttendanceCard(ampm: 'pm', end: '9:00', start: '8:00'),
            //       AttendanceCard(ampm: 'pm', end: '8:00', start: '7:00'),
            //       AttendanceCard(ampm: 'pm', end: '10:00', start: '9:00'),
            //       AttendanceCard(ampm: 'pm', end: '11:00', start: '10:00'),
            //       AttendanceCard(ampm: 'pm', end: '12:00', start: '11:00'),
            //       AttendanceCard(ampm: 'am', end: '18:00', start: '17:00'),
            //       AttendanceCard(ampm: 'am', end: '19:00', start: '18:00'),
            //       AttendanceCard(ampm: 'am', end: '20:00', start: '19:00'),
            //     ],
            //   ),
            // ),
            
            // Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text(
            //         feeText,
            //         style: const TextStyle(fontWeight: FontWeight.w600),
            //       ),
            //       SportPie(colorList: colorList, dataSet: fee),
            //       const SizedBox(height: 10),
            //       Text(
            //         attendanceText,
            //         style: const TextStyle(fontWeight: FontWeight.w600),
            //       ),
            //       SportPie(colorList: colorList, dataSet: attendanceList),
            //     ]),