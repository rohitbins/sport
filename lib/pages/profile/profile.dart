// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_interpolation_to_compose_strings, unused_local_variable

import 'package:flutter/material.dart';
import 'package:sport/pages/profile/payments.dart';
import 'package:sport/pages/profile/personal_info.dart';
import 'package:sport/pages/profile/sport_info.dart';

import '../../attendence.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key, required this.customerKey, required this.name})
      : super(key: key);
  final String customerKey;
  final String name;
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int selectedIndex = 0;

  late List<dynamic> _pageOptions;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _pageOptions = [
      PersonalInfoPage(customerKey: widget.customerKey),
      SportInfo(customerKey: widget.customerKey),
      const Payments(),
      const Attendence(),
      const Payments()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            elevation: 6,
            shadowColor: Colors.grey,
            title: Text(widget.name),
            centerTitle: true,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            selectedFontSize: 14,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white54,
            backgroundColor: const Color.fromRGBO(6, 41, 74, 1),
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Info',
                  backgroundColor: Colors.blueGrey),
              BottomNavigationBarItem(
                  icon: Icon(Icons.sports),
                  label: 'Sports',
                  backgroundColor: Colors.blueGrey),
              BottomNavigationBarItem(
                  icon: Icon(Icons.access_time),
                  label: 'Attendence',
                  backgroundColor: Colors.blueGrey),
              BottomNavigationBarItem(
                  icon: Icon(Icons.payment),
                  label: 'Fees',
                  backgroundColor: Colors.blueGrey),
            ],
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
          body: _pageOptions[selectedIndex]),
    );
  }

  // Widget attendanceCard(Attendance _attendance) {
  //   List<String> duration = [];
  //   DateFormat dateFormat = DateFormat("dd\nMMM");
  //   duration = _attendance.duration
  //       .replaceAll('hr', '')
  //       .replaceAll('min', '')
  //       .split(' ');
  //   return Padding(
  //     padding: const EdgeInsets.only(left: 6, right: 6, top: 5),
  //     child: Card(
  //         shape:
  //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  //         elevation: 4,
  //         child: Row(
  //           children: [
  //             Padding(
  //               padding: const EdgeInsets.only(left: 6),
  //               child: Padding(
  //                 padding: const EdgeInsets.only(top: 3, bottom: 3),
  //                 child: Container(
  //                   margin:
  //                       const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
  //                   padding:
  //                       const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
  //                   decoration: BoxDecoration(
  //                     color: Colors.grey[300],
  //                     borderRadius: BorderRadius.circular(10),
  //                   ),
  //                   child: Text(
  //                     dateFormat
  //                         .format(DateTime.parse(_attendance.inDate))
  //                         .toString(),
  //                     textAlign: TextAlign.center,
  //                     style: TextStyle(
  //                         fontSize: 18,
  //                         fontWeight: FontWeight.bold,
  //                         color: Color(
  //                             int.parse(hexColor(_attendance.dateBGColorHEX)))),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             const SizedBox(width: 20),
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Row(
  //                   children: [
  //                     Text(
  //                       'In    : ',
  //                       style: TextStyle(
  //                           fontSize: 15,
  //                           color: Color(
  //                               int.parse(hexColor(_attendance.inColorHEX)))),
  //                     ),
  //                     Text(
  //                       _attendance.inText,
  //                       style: TextStyle(
  //                         color: Color(
  //                             int.parse(hexColor(_attendance.inColorHEX))),
  //                         fontSize: 18,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //                 Row(
  //                   children: [
  //                     Text(
  //                       'Out : ',
  //                       style: TextStyle(
  //                           fontSize: 15,
  //                           color: Color(
  //                               int.parse(hexColor(_attendance.outColorHEX)))),
  //                     ),
  //                     Text(
  //                       _attendance.inText,
  //                       style: TextStyle(
  //                           color: Color(
  //                               int.parse(hexColor(_attendance.outColorHEX))),
  //                           fontSize: 18,
  //                           fontWeight: FontWeight.bold),
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //             const SizedBox(width: 50),
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Row(
  //                   children: [
  //                     Text(
  //                       duration.first,
  //                       style: TextStyle(
  //                           fontSize: 22,
  //                           fontWeight: FontWeight.bold,
  //                           color: Colors.blue[900]),
  //                     ),
  //                     const SizedBox(width: 5),
  //                     const Text(':'),
  //                     const SizedBox(width: 5),
  //                     Text(
  //                       duration.last,
  //                       style: TextStyle(
  //                           fontSize: 22,
  //                           fontWeight: FontWeight.bold,
  //                           color: Colors.blue[900]),
  //                     )
  //                   ],
  //                 ),
  //                 Row(
  //                   children: [
  //                     const SizedBox(width: 5),
  //                     Text(
  //                       "Hr",
  //                       style: TextStyle(fontSize: 12, color: Colors.blue[800]),
  //                     ),
  //                     const SizedBox(width: 10),
  //                     Text(
  //                       "Min",
  //                       style: TextStyle(fontSize: 12, color: Colors.blue[800]),
  //                     )
  //                   ],
  //                 )
  //               ],
  //             )
  //           ],
  //         )),
  //   );
  // }

}
