import 'package:flutter/material.dart';
import 'package:sport/model/customer_list.dart';
import 'package:sport/pages/profile.dart';
import 'package:sport/service.dart';

import '../widget/secondery_button.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({Key? key, required this.customerListData}) : super(key: key);
  final CustomerListData customerListData;

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    List<CustomerData> dataList = widget.customerListData.data!;
    return ListView.builder(
        shrinkWrap: true,
        itemCount: dataList.length,
        itemBuilder: (BuildContext context, int index) {
          CustomerData customerData = dataList[index];

          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile(customerKey: customerData.customerKey!,)));
            },
            child: Ink(
              child: Padding(
                padding: const EdgeInsets.only(left: 5,right: 5,top: 5),
                child: Card(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  customerData.name!.trim(),
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  customerData.categoryType!,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  customerData.batch.toString(),
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(width: 4),
                                if (customerData.feePending != 0)
                                  Row(
                                    children: [
                                      const Text(
                                        "Fee Pending",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Text(
                                        '(*${customerData.feePending})',
                                        style: const TextStyle(
                                            color: Colors.red,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600),
                                  ),
                                    ],
                                ),
                              ]),
                              ),
                              Container(
                                height: 60,
                                width: 100,
                                color: Colors.green,
                              )
                    //     SizedBox(
                    //       height: 60,
                    //       width: 100,
                    //       child: ElevatedButton(
                    //           style:
                    //               ElevatedButton.styleFrom(primary: Colors.green),
                    //           onPressed: () {
                    //             ServiceCall()
                    //                 .attendanceIn(
                    //                     customerKey: customerData.customerKey!)
                    //                 .then((value) {
                    //               setState(() {
                    //                 customerData.isPlaying = 15;
                    //               });
                    //             });
                    //           },
                    //           child: Text(
                    //               customerData.isPlaying! > 0 ? 'Palying' : 'In',
                    //               style: const TextStyle(
                    //                 fontSize: 20,
                    //                 fontWeight: FontWeight.bold
                    //               ),)),
                    // )
                   ]),
                  
                 ),
              ),
              ),
             );
           });
  }
}
