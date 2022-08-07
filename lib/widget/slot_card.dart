import 'package:flutter/material.dart';

class SlotCard extends StatelessWidget {
  SlotCard(
      {Key? key,
      required this.selectedbatch,
      required this.title,
      required this.subTitle,
      required this.callBack})
      : super(key: key);
  String title;
  String subTitle;
  Function callBack;
  bool selectedbatch;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => callBack(),
      child: Card(
        color: selectedbatch ? Colors.grey : null,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: selectedbatch ? Colors.blue.shade900 : Colors.black),
              ),
              Row(
                children: [
                  Text(
                    subTitle,
                    style: TextStyle(
                        fontSize: 10,
                        color: !selectedbatch
                            ? Colors.blue.shade900
                            : Colors.white),
                  ),
                  Icon(Icons.access_time,
                      color:
                          !selectedbatch ? Colors.blue.shade900 : Colors.white),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
