import 'package:flutter/material.dart';
import 'package:sport/utils/functions.dart';
import '../../model/payment.dart';
import '../../service.dart';
import '../../utils/constants.dart';


class Payments extends StatefulWidget {
  const Payments({Key? key, required this.customerkey}) : super(key: key);

  final String customerkey;
  @override
  State<Payments> createState() => _PaymentsState();
}
  class _PaymentsState extends State<Payments> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        body: FutureBuilder<List<Payment>?>(
            future: ServiceCall().fetchPayment( customerkey: widget.customerkey),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if(snapshot.data!.isEmpty){
                  return const Text('No Data');
                }
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
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
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Center(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Column(children: [
                                          Text(
                                            formatter
                                                   .format(DateTime.parse(
                                                    snapshot.data![index].date))
                                               .toString(),
                                                style: TextStyle(
                                                color: Color(int.parse(hexColor(
                                                         snapshot.data![index]
                                                        .dateBGColorHex
                                                        .toString()))),
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                                textAlign: TextAlign.center,
                                          )
                                       ]),
                                       ),
                                      ),
                                     ),
                                    ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data![index].firstText,
                                        style: TextStyle(
                                                color: Color(int.parse(hexColor(
                                                snapshot.data![index]
                                                    .firstTextColorHex
                                                    .toString()))),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        snapshot.data![index].secondTextText,
                                        style: TextStyle(
                                        color: Color(int.parse(hexColor(
                                                   snapshot.data![index]
                                                  .secondTextColorHex
                                                  .toString()))),
                                          fontSize: 11,
                                        ),
                                       ),
                                     ]),
                                     ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        '₹${snapshot.data![index].amount}',
                                        style: TextStyle(
                                            color: Color(int.parse(hexColor(
                                                snapshot
                                                    .data![index].amountColorHEX
                                                    .toString()))),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      )
                                    ],
                                  ),
                                 ),
                              ],
                               ),
                              ),
                          const SizedBox(
                            height: 5,
                          )
                        ],
                      );
                    });
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              return const Center(child: CircularProgressIndicator());
            }));
  }
}
