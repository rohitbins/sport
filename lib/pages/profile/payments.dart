import 'package:flutter/material.dart';
import '../../model/payment.dart';
import '../../service.dart';
import '../../utils/constants.dart';
import 'profile.dart';

class Payments extends StatefulWidget {
  const Payments({Key? key}) : super(key: key);
  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<Payment>?>(
            future: ServiceCall().fetchPayment(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return paymentCard(snapshot.data![index]);
                    });
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return const Center(child: CircularProgressIndicator());
            }));
  }

  Widget paymentCard(Payment payment) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  formatter.format(DateTime.parse(payment.date)).toString(),
                  style: TextStyle(
                      color: Color(int.parse(
                          hexColor(payment.dateBGColorHex.toString()))),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // Text(
            //   payment.firstText,
            //   style: TextStyle(
            //       color: Color(int.parse(
            //           hexColor(payment.firstTextColorHex.toString()))),
            //       fontWeight: FontWeight.bold,
            //       fontSize: 18),
            // ),
            const SizedBox(height: 5),
            Text(
              payment.secondTextText,
              style: TextStyle(
                  color: Color(int.parse(
                      hexColor(payment.secondTextColorHex.toString()))),
                  fontSize: 11),
            ),
          ]),
        ),
        Expanded(
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Text(
              "₹${payment.amount}",
              style: TextStyle(
                  color: Color(
                      int.parse(hexColor(payment.amountColorHEX.toString()))),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const SizedBox(width: 20)
          ]),
        ),
      ]),
    );
  }
}
