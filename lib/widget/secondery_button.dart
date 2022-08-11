import 'package:flutter/material.dart';

class SeconderyButton extends StatefulWidget {
  SeconderyButton({Key? key, this.doubleTap, required this.title, this.color})
      : super(key: key);
  Function? doubleTap;
  final String title;
  final Color? color;
  @override
  State<SeconderyButton> createState() => _SeconderyButtonState();
}

class _SeconderyButtonState extends State<SeconderyButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onDoubleTap: () => widget.doubleTap!(),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: widget.color == null ? Colors.green : widget.color!,
              border: Border.all(
                  color: widget.color == null ? Colors.green : widget.color!),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              boxShadow: const [BoxShadow(spreadRadius: 1, blurRadius: 1)]),
          width: 80,
          height: 30,
          child: Text(
            widget.title,
            style: const TextStyle(color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ));
  }
}
