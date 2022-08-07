import 'package:flutter/material.dart';

class SportCircleAvatar extends StatelessWidget {
  SportCircleAvatar({Key? key, required this.name, this.color, this.url})
      : super(key: key);
  String? url;
  String name;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CircleAvatar(
        backgroundColor: const Color(0xff00A3FF),
        backgroundImage: NetworkImage(url ?? ''),
        radius: 22.0,
        child: Text(
          name,
          style: const TextStyle(fontSize: 20),
        ),
      ),
      Positioned(
        right: 0,
        bottom: 0,
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.white),
              borderRadius: BorderRadius.circular(30.0),
              color: color ?? Colors.green),
        ),
      )
    ]);
  }
}
