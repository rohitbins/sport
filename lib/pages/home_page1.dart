// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport/model/check_permisson.dart';

import 'package:sport/pages/my_attendance.dart';
import 'package:sport/pages/pending_fee_page.dart';
import 'package:sport/service.dart';
import 'package:sport/utils/constants.dart';
import '../model/dashboard.dart';
import '../utils/homepage_live_values.dart';
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

late PermissonData Permission;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mode == 'TEST'?Colors.red[700]:Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if(AcademyLogo !=null)
            Image.network(AcademyLogo.toString(),scale: 3,),
            Text(
              userName,
              style: const TextStyle(fontSize: 11),
            ),
          ]),
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
            ]),
        body: 
    (TakePNPAttendance==false && TakeMemberAttendance == false)?Center(child: Text('Coming Soon...',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600,color: Colors.blueGrey[600]),)):
      SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 25),
              decoration:  BoxDecoration(color: Color.fromRGBO(7,41, 73, 1)),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 45),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Today',style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Colors.orange[400]),),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Flexible(
                                child: Text(todayFirst.toString(),
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                                  ),
                              ),
                              Text('/',
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color:  Colors.orange[400]),
                              ),
                              Flexible(
                                child: Text(todaySecond.toString(),
                                  style: TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  FutureBuilder<Dashboard>(
                      future: ServiceCall().fetchDashboardData(),
                      builder: (context, snapshot){
                    if(snapshot.hasData) {
                      return
                        Column(
                          children: [
                            for(var i in snapshot.data!.data!.attendanceData)
                             Container(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                            Row(
                              children: [
                               SizedBox(
                               child: Text(
                                i.customerType.toString().trim(),
                                style: const TextStyle(fontSize: 18,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                                ),
                            ),
                            width: MediaQuery
                                .of(context)
                                .size
                                .width / 4,
                            )
                         ]),
                            Row(
                              children: [
                                Text(i.playingCount.toString(),style: TextStyle(color:Colors.white,fontSize: 16,fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Text(i.totalCount.toString(),style: TextStyle(color:Colors.white,fontSize: 16,fontWeight: FontWeight.bold))
                            ],
                            ),
                            ),
                          ],
                        );
                      }
                    else{
                      return const CircularProgressIndicator();
                        }
                  }),
                 ]),
                 ),
          ),
          SizedBox(height: 10),
          if(ShowFee)
           Container(
             margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
             decoration: BoxDecoration(
               boxShadow: const [
                 BoxShadow(
                   color: Colors.grey,
                   blurRadius: 4,
                   spreadRadius: 1,
                   offset: Offset(2, 2),
                 )
               ],
               color: Colors.white,
               borderRadius: BorderRadius.circular(10),
             ),
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 25),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 25),
                    Text('Pending Fee',style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(237, 11, 11, 1)),),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            child: Text(feeFirst.toString(),
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(7,41, 73, 1)),
                            ),
                          ),
                          Text('/',
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                          Flexible(
                            child: Row(
                              children: [
                                Icon(Icons.currency_rupee,size: 19,),
                                Text(feeSecond.toString(),
                                  softWrap: true,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
               const SizedBox(height: 30,),
                FutureBuilder<Dashboard>(
                    future: ServiceCall().fetchDashboardData(),
                    builder: (context, snapshot){
                      if(snapshot.hasData){
                        return
                          Column(
                            children: [
                              for(var i in snapshot.data!.data!.feeData)
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>  PendingFeeList(Member: i.customerType.toString(),)));
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(children: [
                                          SizedBox(
                                          child: Text(
                                            i.customerType.toString(),
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),),
                                          width: MediaQuery.of(context).size.width/4,
                                        )],),
                                        Text(i.feeCount.toString(),style: TextStyle(color:Colors.black,fontSize: 16,fontWeight: FontWeight.bold)),
                                        Row(
                                          children: [
                                            Icon(Icons.currency_rupee,color: Colors.green[900],size: 15,),
                                            Text(i.feeAmount.toString(),style: TextStyle(color:Colors.black,fontSize: 16,fontWeight: FontWeight.bold)),
                                          ],
                                        )
                                      ]),
                                      ),
                                     ),
                                   ]);
                      }
                      else{
                        return const CircularProgressIndicator();
                      }
                    }),

           ]),
           ),
          ]),
    )
       );
  }
}



