import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport/model/check_permisson.dart';

import 'package:sport/pages/my_attendance.dart';
import 'package:sport/service.dart';
import 'package:sport/utils/constants.dart';
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
    // print('canlogin1 = '+CanLogin.toString());
    ServiceCall().fetchPermissonData().then((value) => {if(CanLogin == false){
      // print('canlogin2 = '+CanLogin.toString()),
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Login()))
    }});
    return Scaffold(
      backgroundColor: Mode == 'TEST'?Colors.red[700]:Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
        body:  SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(height: 15),
                (Mode == 'TEST')? 
                const Padding(padding:EdgeInsets.symmetric(vertical: 10),
                child: Text('TEST MODE',style: TextStyle(
                fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white))): const SizedBox(),
                
                // Current Playing
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.teal[400],
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 7,
                            spreadRadius: 3,
                            offset: Offset(2,2)
                        )
                      ]
                  ),
                  child: Column(
                    children: [
                      Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: const[
                          Icon(Icons.av_timer,size: 50,color: Colors.white),
                          SizedBox(width: 10),
                          Text('Currently Playing',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                        ],),
                    const SizedBox(height: 10),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Members",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500
                            ),),
                            SizedBox(height: 12),
                            Text("Studentes",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500
                            ),),
                            SizedBox(height: 12),
                            Text("PPR",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500
                            ),)
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 2),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                        color: Colors.grey[300],),
                        child: const Text('30',style: TextStyle(fontSize: 20),)),
                        const SizedBox(height: 12),

                         Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 2),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                        color: Colors.grey[300],),
                        child: const Text('30',style: TextStyle(fontSize: 20),)),
                        const SizedBox(height: 12),

                         Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 2),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                        color: Colors.grey[300],),
                        child: const Text('30',style: TextStyle(fontSize: 20),))
                          ],
                        )
                      ],
                     )

                   

                  ],),
                ),
                const SizedBox(height: 20),

                // Total Pending Fee
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.teal[300],
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 7,
                            spreadRadius: 3,
                            offset: Offset(2,2)
                        )
                      ]
                  ),
                  child: Column(
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.currency_rupee,size: 50,color: Colors.red[800]),
                          const SizedBox(width: 10),
                          const Text('Total Pending Fee',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    const SizedBox(height: 30),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const[
                          Text('Members ',style: TextStyle(
                      fontSize: 18,fontWeight: FontWeight.w500),),
                      SizedBox(height: 15),
                      Text("Students",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                      ),)
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 2),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                        color: Colors.grey[300],),
                        child: Row(
                      children: [
                       const Text('15',style: TextStyle(fontSize: 20),),
                        Text(' | ',style: TextStyle(
                        fontSize: 20,fontWeight: FontWeight.w500,color: Colors.red[600]),),
                        const Text('4000',style: TextStyle(fontSize: 20),),
                      ],
                    )),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 2),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                        color: Colors.grey[300],),
                        child: Row(
                      children: [
                       const Text('15',style: TextStyle(fontSize: 20),),
                        Text(' | ',style: TextStyle(
                        fontSize: 20,fontWeight: FontWeight.w500,color: Colors.red[600]),),
                        const Text('4000',style: TextStyle(fontSize: 20),),
                      ],
                    ))
                        ],
                      )
                    ],
                   ),
                      

                    
                      const SizedBox(height: 10), ],),
                ),
                const SizedBox(height: 20),

                // Total Played
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.teal[200],
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 7,
                            spreadRadius: 3,
                            offset: Offset(2,2)
                        )
                      ]
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.timer,size: 50,color: Colors.orange[800]),
                          const SizedBox(width: 10),
                          const Text('Total Today Played',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    const SizedBox(height: 30),
                   
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Members",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500
                            ),),
                            SizedBox(height: 12),
                            Text("Studentes",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500
                            ),),
                            SizedBox(height: 12),
                            Text("PPR",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500
                            ),)
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 2),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                        color: Colors.grey[300],),
                        child: const Text('30',style: TextStyle(fontSize: 20),)),
                        const SizedBox(height: 12),

                         Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 2),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                        color: Colors.grey[300],),
                        child: const Text('30',style: TextStyle(fontSize: 20),)),
                        const SizedBox(height: 12),

                         Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 2),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                        color: Colors.grey[300],),
                        child: const Text('30',style: TextStyle(fontSize: 20),))
                          ],
                        )
                      ],
                     )

                  
                  ],),
                ),
              ],

          ),
        )
     );
  }
}



