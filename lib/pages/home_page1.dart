import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport/pages/dashboard_page.dart';
import 'package:sport/pages/my_attendance.dart';
import 'package:sport/pages/my_payment.dart';
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
  List<Color> colorList = [Colors.green, Colors.orange];

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List<String> drawerElements = [
    'My Dashboard',
    'My Attendance',
    'My Payment',
    'Logout'
  ];

  List<IconData> icons = [
   Icons.person,
   Icons.access_alarm_outlined,
   Icons.currency_rupee,
   Icons.logout
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(drawerElements),
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
              style: const TextStyle(fontWeight: FontWeight.w600),
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
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SportPie(colorList: colorList, dataSet: fee),
                  const SizedBox(height: 10),
                  Text(
                    attendanceText,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SportPie(colorList: colorList, dataSet: attendanceList),
                ]),

            
          ]),
        ),
      ),
    );
  }

  drawer(List<String> drawerElement) {
    return Drawer(
      child: ListView.builder(
        itemCount: drawerElements.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            );
          } else {
            return ListTile(
              leading: Icon(
                icons[index - 1]
              ),
              title: Text(drawerElements[index - 1]),
              onTap: () {
                onDrawerElement(index, context);
              },
            );
          }
        },
      ),
    );
  }

  void onDrawerElement(int i, context) {
    print(i);
    switch (i) {
      case 0:
       
        break;
      case 1:
         {
          Navigator.push(context, MaterialPageRoute (builder: (context) => const DashboardPage(),));
        }
        break;
      case 2:
       {
          Navigator.push(context, MaterialPageRoute (builder: (context) => const MyAttendance(),));
        }
        break;
      case 3:
       {
          Navigator.push(context, MaterialPageRoute (builder: (context) => const MyPayment(),));
        }
        break;
      case 4:
        {
          Navigator.pop(context);
          _prefs.then((value) {
            value.clear();
          });
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const Login()));
        }
        break;
    }
  }
}
