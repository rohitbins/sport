import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Const {
  String player = 'Player\'s In';
}
bool HasConnection = false;
 int IsChangedCount = 0;
bool? IsDataListNull = true;
String Mode = "LIVE"; //to connect to live db use "LIVE" and for test db use "TEST"
int? SelectedIndex;
String? PhoneNumber;
bool HasInData = true;
String? KEY;
String? Month;
String? Year;
String? Messg;
String? NAME = '';
bool? TakePNPAttendance = false;
bool? TakeMemberAttendance = false;
bool? IsChanged = false;
bool? CanLogin = false;
bool ShowFee = false;
String? AcademyLogo;
const String noRecordAvailable = 'No Record Available';

final DateFormat formatter = DateFormat('d\nMMM');
const String splash = 'assets/images/splash.jpeg';

const Color myBlue = Color(0xFF27ae60);
const Color myYellow = Color(0xFFf1c40f);
