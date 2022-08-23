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
    super.initState();
    _pageOptions = [
      PersonalInfoPage(customerKey: widget.customerKey),
      SportInfo(customerKey: widget.customerKey),
      const Attendence(),
      const Payments(),
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
}
