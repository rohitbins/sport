import 'package:flutter/material.dart';
import 'package:sport/service.dart';

import 'datebox.dart';
import 'model/attendance.dart';
import 'utils/constants.dart';
import 'utils/functions.dart';

class Attendence extends StatefulWidget {
  const Attendence({Key? key, required this.customerkey}) : super(key: key);
  final String customerkey;

  @override
  State<Attendence> createState() => _AttendenceState();
}

class _AttendenceState extends State<Attendence> {
  String rowIndex = '0';
  bool hasMore = true, isLoading = false;
  bool duration = false;
  List<Attendance>? fetchList = [];
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _getAttendence();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset && hasMore) {
        _getAttendence();
      }
    });
  }

  _getAttendence() async {
    ServiceCall().fetchAttendance(customerkey: widget.customerkey).then((value) {
      setState(() {
        fetchList = value;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  Future refresh() async {
    setState(() {
      fetchList!.clear();
      rowIndex = '0';
    });
    _getAttendence();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: RefreshIndicator(
          onRefresh: refresh,
          child: fetchList!.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: fetchList!.length + 1,
                  controller: controller,
                  itemBuilder: (BuildContext context, int index) {
                    if (fetchList!.isEmpty) {
                      return const Center(
                        child: Text(
                          noRecordAvailable,
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black38),
                        ),
                      );
                    } else if (index < fetchList!.length) {
                      
                      duration = fetchList![index].duration == "Playing Now";
                      return Column(children: [
                        const SizedBox(height: 20),
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
                          child: Row(children: [
                            DateBox(
                                dateTime:
                                    DateTime.parse(fetchList![index].inDate)),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                        text: 'IN : ',
                                        style: const TextStyle(
                                            color: Colors.black38,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                        children: [
                                          TextSpan(
                                              text: fetchList![index]
                                                  .inText
                                                  .toString(),
                                                  style: TextStyle(
                                                  color: Color(int.parse(
                                                      hexColor(fetchList![index]
                                                          .inColorHEX
                                                          .toString()))),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14))
                                        ]),
                                        ),
                                  const SizedBox(height: 20),
                                  (fetchList![index].duration.contains('hr') ||
                                          fetchList![index]
                                              .duration
                                              .contains('min'))
                                      ? RichText(
                                          text: TextSpan(
                                              text: 'OUT : ',
                                              style: const TextStyle(
                                                  color: Colors.black38,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                              children: [
                                                TextSpan(
                                                    text: fetchList![index]
                                                        .outText
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Color(int.parse(
                                                            hexColor(fetchList![
                                                                    index]
                                                                .outColorHEX
                                                                .toString()))),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14),
                                                 )
                                              ]),
                                               )
                                      : const Text(''),
                                           ]),
                                            (!duration) ?  
                                                                  Expanded(
                                child:
                                   
                                    Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                  const SizedBox(width: 30),
                                  Column(children: [
                                    Text(
                                      playDuration(fetchList![index].duration)
                                          .first,
                                        style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(41, 128, 185, 1),
                                      ),
                                    ),
                                    const Text(
                                      'Hr',
                                          style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ]),
                                  const SizedBox(width: 7),
                                  Column(children: const [
                                    Text(
                                      ':',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 20)
                                  ]),
                                  const SizedBox(width: 7),
                                  Column(children: [
                                    Text(
                                      playDuration(fetchList![index].duration)
                                          .last,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54),
                                    ),
                                    const Text(
                                      'Min',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    )
                                 ]),
                                 ])
                               
                                ): const Padding(
                                  padding: EdgeInsets.only(left: 60),
                                  child: Text("Playing Now",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold

                                  ),
                                  ),
                                )
                             ]),
                             ),
                           ]);


                                         
    
                    } else {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        child: Center(
                          child: hasMore
                              ? const CircularProgressIndicator()
                              : const Text(
                                  noRecordAvailable,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      fontSize: 15),
                                ),
                               ),
                              );
                    }
                  },
                           ),
                          ),
                         );
  }
}
