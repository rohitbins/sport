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

  
  final String attendanceText = 'Attendance';
  final String feeText = 'Fee';
  String userName = '';
 
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
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    _prefs.then((value){
      TakePNPAttendance = value.getBool('takePNPAttendance');
      TakeMemberAttendance= value.getBool('tekeMemberAttendance');
      CanLogin = value.getBool('canLogin');
      ShowFee = value.getBool(("fees"))!;
    });
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
    // ServiceCall().fetchDashboardData();
    // ServiceCall().fetchDashboardData().then((value) => {if(CanLogin == false){
    //   // print('canlogin2 = '+CanLogin.toString()),
    //   Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Login()))
    // }}).then((value) => {
    // // print('Showfee = '+ShowFee.toString())
    // });
    return Scaffold(
      backgroundColor: Mode == 'TEST'?Colors.red[700]:Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network('http://booking.sportsb.co.in/images/AcademyLogo/noLogo.png',scale: 2.5,),
            Text(
              userName,
              style: const TextStyle(fontSize: 12),
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
    (TakePNPAttendance==false && TakeMemberAttendance == false)?
    Center(child: Text('Coming Soon...',
    style: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w600,
      color: Colors.blueGrey[600]),)):
      SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 25),
            decoration:  BoxDecoration(color: Colors.green[600]),
            child: Column(
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children:const [
                          Text('Today',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                            ),
                          SizedBox(width: 10),
                          Icon(Icons.timelapse,size: 30),
                        ],
                      )]
                       ),
                       Row(
                        children: const[
                          Padding(
                            padding: EdgeInsets.only(left: 185),
                            child: Text(
                              "Playing",
                               style: TextStyle(
                               fontWeight: FontWeight.w600,
                               fontSize: 14),),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 70),
                            child: Text(
                              "Total",
                              style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14),),
                          )
                        ],
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
                              fontWeight: FontWeight.w600,
                              ),
                          ),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 4,
                          )
                       ]),
                          Container(
                          padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 8,),
                          decoration: BoxDecoration(
                          borderRadius:const BorderRadius.all(Radius.circular(5)),
                          color: Colors.grey[300]),
                          child: Row(
                            children: [
                              Text(i.playingCount.toString()),
                            ],
                          ),),
                          Container(
                          padding:const EdgeInsets.symmetric(vertical: 3,horizontal: 8,),
                          decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                          color: Colors.grey[300]),
                          child: Text(i.totalCount.toString()),)
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
         const SizedBox(height: 10),
          ShowFee?
           Container(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 25),
            decoration:const BoxDecoration(color: Colors.teal),
            child: Column(
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const Text('Pending Fee',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),),
                          const SizedBox(width: 10),
                          Icon(Icons.currency_rupee_rounded,color: Colors.red[900],size: 30,),
                        ],
                      )],),
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
                                    Navigator.push(
                                      context, 
                                      MaterialPageRoute(
                                        builder: (
                                          BuildContext context) =>  PendingFeeList(
                                            Member: i.customerType.toString(),
                                            )
                                           )
                                            );},

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
                                        Container(
                                          padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 8,),
                                          decoration: BoxDecoration(
                                              borderRadius:const BorderRadius.all(Radius.circular(5)),
                                              color: Colors.grey[300]),
                                          child: Row(
                                            children: [
                                              Icon(Icons.currency_rupee,color: Colors.green[600],size: 15,),
                                              Text(i.feeCount.toString()),
                                            ],
                                          ),
                                          ),

                                        Container(
                                          padding:const EdgeInsets.symmetric(vertical: 3,horizontal: 8,),
                                          decoration: BoxDecoration(
                                              borderRadius:const BorderRadius.all(Radius.circular(5)),
                                              color: Colors.grey[300]),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.currency_rupee,color: Colors.green[600],size: 15,),
                                                  Text(i.feeAmount.toString()),
                                                ],
                                              ),
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
           ) : const SizedBox(),
          ]),
    )
       );
  }
}



