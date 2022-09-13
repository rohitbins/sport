// ignore_for_file: curly_braces_in_flow_control_structures, prefer_is_empty, sized_box_for_whitespace

import 'package:flutter/material.dart';
import '../model/staff_attendance_model.dart';
import '../service.dart';

class MyAttendance extends StatefulWidget {
  const MyAttendance({Key? key}) : super(key: key);

  @override
  State<MyAttendance> createState() => _MyAttendanceState();
}

class _MyAttendanceState extends State<MyAttendance> {
  StaffAttendanceModel staffAttendanceModel = StaffAttendanceModel();
  ServiceCall serviceCall = ServiceCall();
  

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() async {    //working
    serviceCall.GetStaffAttendanceList().then((value) {
      setState(() {
staffAttendanceModel = value!;
        print('staffAttendanceModel = '+staffAttendanceModel.toString());
      });
    });
  }

  bool clicked = false;
  bool staffInside = false;
  bool _noAttendence = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Attendance",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: staffAttendanceModel.data != null
             ? ListView(
           physics: const NeverScrollableScrollPhysics(),
            children: [
              staffAttendanceModel.data!.length>0?
                 _todays(staffAttendanceModel.data![0]):_onlyFirstIn(),
                   SizedBox(
                    height: MediaQuery.of(context).size.height*.788,
                     child: ListView.builder(
                      primary: true,
                                   shrinkWrap: true,
                                     itemCount: staffAttendanceModel.data!.length,
                                     itemBuilder: (BuildContext context, int index) {

                      return myCard(staffAttendanceModel.data![index]);
                                     },
                                   ),
                   ),
            ],
          )
          : const Center(
              child: Text('No Attendence',style: TextStyle(fontSize: 30,color: Colors.grey,fontWeight: FontWeight.bold),),
            ),
    );
  }

  Widget _todays(StaffData data) {
    return Container(
      color: const Color.fromARGB(255, 235, 195, 195),
      // elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            !clicked
                ? Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: ElevatedButton(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 12),
                          child: Text(
                            data.outTime!.length>0 ? 'In' : 'Out',
                            style: const TextStyle(fontSize: 24),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            clicked = !clicked;
                          });
                          serviceCall
                              .updateStaffAttendance(isIn: data.outTime!.length>0?true:false)
                              .then((value) {
                            setState(() {
                              if (value!.message == "Done")
                                staffInside = !staffInside;
                              clicked = !clicked;
                            });
                            fetchData();
                          });
                        }),
                  )
                : const CircularProgressIndicator(),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    "Last ${data.outTime!.length>0 ? 'Out' : 'In'}",
                    style: const TextStyle(letterSpacing: 1.4),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    (data.outTime!.length>0)? "${data.outTime}" : "${data.inTime}",
                    // data.outTime!,
                  ),
                ),

                Text(
                  data.inDate!,
                  style: const TextStyle(fontSize: 10),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget _onlyFirstIn() {
    return Container(
      color: const Color.fromARGB(255, 235, 195, 195),
      // elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            !clicked
                ? Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: ElevatedButton(
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 12),
                          child: Text(
                            'In',
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            clicked = !clicked;
                          });
                          serviceCall
                              .updateStaffAttendance(isIn: true/**/)
                              .then((value) {
                            setState(() {
                              if (value!.message == "Done")
                                staffInside = !staffInside;
                              clicked = !clicked;
                            });
                            fetchData();
                          });
                        }),
                  )
                : const CircularProgressIndicator(),

          ],
        ),
      ),
    );
  }

  Widget myCard(StaffData data) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 2),
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
      child: Row(children: [
        if (data.inDate != '')
          Container(
            margin: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(15.0),
            child: Text(
              data.inDate!.replaceAll(' ', '\n'),
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          RichText(
            text: TextSpan(
                text: 'IN : ',
                style: const TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
                children: [
                  TextSpan(
                    text: data.inTime,
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  )
                ]),
          ),
          const SizedBox(height: 7),
          RichText(
            text: TextSpan(
                text: 'OUT : ',
                style: const TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
                children: [
                  TextSpan(
                      text: data.outTime,
                      style: const TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                          fontSize: 14))
                ]),
          ),
          const SizedBox(height: 7),
          Row(
            children: [
              
              Text(data.outDate.toString(),
              style: const TextStyle(
              fontWeight: FontWeight.bold
              ),),
            ],
          )
        ]),
        if (data.totalInTime != '')
          Expanded(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(width: 30),
              Column(children: [
                Text(
                  getHours(data.totalInTime!),
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(41, 128, 185, 1),
                  ),
                ),
                const Text(
                  'Hr',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                )
              ]),
              const SizedBox(width: 7),
              Column(children: const [
                Text(
                  ':',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20)
              ]),
              const SizedBox(width: 7),
              Column(children: [
                Text(
                  getMinuts(data.totalInTime!),
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                const Text(
                  'Min',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
              ]),
            ]),
          ),
      ]),
    );
  }

  String getHours(String duration) {
    return duration.split(':').first.trim().length == 1
        ? '0${duration.split(':').first.trim()}'
        : duration.split(':').first.trim();
  }

  String getMinuts(String duration) {
    return duration.split(':').last.trim().length == 1
        ? '0${duration.split(':').last.trim()}'
        : duration.split(':').last.trim();
  }
}
