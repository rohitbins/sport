import 'package:flutter/material.dart';
import 'utils/constants.dart';

class DateBox extends StatelessWidget {
  const DateBox({Key? key, required this.dateTime}) : super(key: key);
  final DateTime dateTime;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(15.0),
      child: Text(
        formatter.format(dateTime),
        style: const TextStyle(
        color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
