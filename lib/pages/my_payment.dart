import 'package:flutter/material.dart';

class MyPayment extends StatefulWidget {
  const MyPayment({Key? key}) : super(key: key);

  @override
  State<MyPayment> createState() => _MyPaymentState();
}

class _MyPaymentState extends State<MyPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Payment",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15
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
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 7,
                    spreadRadius: 3,
                    offset: Offset(2,2)
                  )
               ]),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
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
                   Text("Detail",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),),
                   Text("Amount", style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),)
                   ]),
                   ),
                  ),
                  )
               ]),
               );
  }
}