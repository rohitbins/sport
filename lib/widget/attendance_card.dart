import 'package:flutter/material.dart';

class AttendanceCard extends StatefulWidget {
  AttendanceCard(
      {Key? key, required this.ampm, required this.end, required this.start})
      : super(key: key);
  String start, end, ampm;

  @override
  State<AttendanceCard> createState() => _AttendanceCardState();
}

class _AttendanceCardState extends State<AttendanceCard> {
  DateTime now = DateTime.now();
  late DateTime check;
  String current = 'Current';
  late int slotHours;
  @override
  void initState() {
    slotHours = (int.parse(widget.end.split(':').first)) - now.hour;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 8),
          Text(
            slotHours == 1
                ? current
                : "${widget.start} - ${widget.end} | ${widget.ampm}",
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          Container(
            height: 30,
            width: 120,
            margin: const EdgeInsets.symmetric(horizontal: 6),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text(
                  "10",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.green),
                ),
                VerticalDivider(indent: 2, color: Colors.black87, thickness: 1),
                Text(
                  "10",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.red),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
