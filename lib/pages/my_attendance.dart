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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 70,
              width: 370,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: const[
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 8,
                    spreadRadius: 3,
                    offset: Offset(2,2)
                  )
                ]
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const[
                    Text("Date",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),),
                    Text("In",
                     style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),),
                    Text("Out",
                     style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),),
                    Text("Hrs",
                     style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}







// Container(
//                        padding: const EdgeInsets.only(top: 15),
//                       height: 80,
//                       width: 80,
//                       decoration: const BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(15),
//                           bottomLeft: Radius.circular(15)
//                         )
//                       ),
//                       child: Column(
//                         children: const[
//                           Text("Date",
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold
//                           ),
//                           textAlign: TextAlign.center,),
//                           Text("25 aug")
//                         ],
//                       ),
//                     ),
//                      Container(
//                        padding: const EdgeInsets.only(top: 15),
//                       height: 80,
//                       width: 104,
//                       child: Column(
//                         children: const[
//                           Text("In",
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold
//                           ),
//                           textAlign: TextAlign.center,),
//                           Text("01:00 PM")
//                         ],
//                       ),
//                     ),
//                      Container(
//                        padding: const EdgeInsets.only(top: 15),
//                       height: 80,
//                       width: 104.5,
//                       child: Column(
//                         children: const[
//                           Text("Out",
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold
//                           ),
//                           textAlign: TextAlign.center,),
//                           Text("03:50 PM")
//                         ],
//                       ),
//                     ),
//                     Container(
//                       padding: const EdgeInsets.only(top: 20),
//                       height: 80,
//                       width: 80,
//                      decoration: const BoxDecoration(
//                       borderRadius: BorderRadius.only(
//                         topRight: Radius.circular(15),
//                         bottomRight: Radius.circular(15)
//                       )
//                      ),
//                      child: Column(
//                        children:const [
//                          Text("Hrs",
//                          style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold
//                           ),
//                          textAlign: TextAlign.center,),
//                          Text("08:30")
//                        ],
//                      ),
//                     ),