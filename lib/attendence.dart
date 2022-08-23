import 'package:blinking_text/blinking_text.dart';
import 'package:flutter/material.dart';
import 'package:sport/service.dart';

import 'model/attendance.dart';
import 'utils/constants.dart';

class Attendence extends StatefulWidget {
  const Attendence({Key? key}) : super(key: key);

  @override
  State<Attendence> createState() => _AttendenceState();
}

class _AttendenceState extends State<Attendence> {
  String rowIndex = '0';
  bool hasMore = true, isLoading = false;
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
    ServiceCall().fetchAttendance().then((value) {
      setState(() {
        fetchList = value;
      });
    });
  }

  hexColor(String colorhexcode) => '0xff$colorhexcode'.replaceAll('#', '');

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

  List<String> minutes = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   centerTitle: true,
        //   backgroundColor: Color(int.parse(hexColor('#2980b9'))),
        //   title: const Text('Attendence'),
        // ),
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
                            Container(
                              margin: const EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                formatter.format(
                                    DateTime.parse(fetchList![index].inDate)),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
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
                                                        fontSize: 14))
                                              ]),
                                        )
                                      : const Text(''),
                                ]),
                            Expanded(
                              child: (fetchList![index]
                                          .duration
                                          .contains('hr') ||
                                      fetchList![index]
                                          .duration
                                          .contains('min'))
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                          const SizedBox(width: 30),
                                          Column(children: [
                                            Text(
                                              fetchList![index]
                                                      .duration
                                                      .contains('hr')
                                                  ? fetchList![index]
                                                      .duration
                                                      .split('hr')[0]
                                                  : '0',
                                              style: const TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromRGBO(
                                                    41, 128, 185, 1),
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
                                              fetchList![index].duration.isEmpty
                                                  ? '0'
                                                  : fetchList![index]
                                                          .duration
                                                          .contains('hr')
                                                      ? minutes.contains(
                                                              fetchList![index]
                                                                  .duration
                                                                  .split(' ')[1]
                                                                  .replaceAll(
                                                                      'min',
                                                                      ''))
                                                          ? "0${fetchList![index].duration.split(' ')[1].replaceAll('min', '')}"
                                                          : fetchList![index]
                                                              .duration
                                                              .split(' ')[1]
                                                              .replaceAll(
                                                                  'min', '')
                                                      : minutes.contains(
                                                              fetchList![index]
                                                                  .duration
                                                                  .split(
                                                                      'm')[0])
                                                          ? "0${fetchList![index].duration.split('m')[0]}"
                                                          : fetchList![index]
                                                              .duration
                                                              .split('m')[0],
                                              style: const TextStyle(
                                                  fontSize: 30,
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
                                  : Padding(
                                      padding: const EdgeInsets.only(left: 30),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            BlinkText(
                                              fetchList![index].duration,
                                              duration:
                                                  const Duration(seconds: 1),
                                              beginColor: Colors.white,
                                              endColor: Colors.red,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ]),
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
        ));
  }
}