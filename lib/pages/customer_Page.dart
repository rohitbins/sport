import 'package:flutter/material.dart';
import 'package:sport/model/customer_list.dart';
import 'package:sport/service.dart';
import 'package:sport/utils/constants.dart';
import '../model/request/customer_data.dart';

class CustomerPage extends StatefulWidget {
  CustomerPage({Key? key, required this.batch, required this.category})
      : super(key: key);
  int batch;
  int category;
  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  late Future<CustomerListData> futureCustomerData;
  int inside = 15;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Const().player),
          centerTitle: true,
          actions: const [
            // FlatButton(
            //   textColor: Colors.white,
            //   onPressed: () {},
            //   child: Text('In : $inside'),
            //   shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            // ),
          ],
        ),
        body: FutureBuilder<CustomerListData>(
            future: ServiceCall().fetchCustomerData(
                customerDataRequest: CustomerDataRequest(
                    batchId: '${widget.batch}',
                    categoryId: '${widget.category}')),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<CustomerData> customerDataList = snapshot.data!.data!;
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: customerDataList.length,
                    itemBuilder: (BuildContext context, int index) {
                      CustomerData customerData = customerDataList[index];

                      return InkWell(
                        onTap: () {},
                        child: Ink(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 10),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // SportCircleAvatar(
                                    //   name: customerData.name
                                    //       .trim()
                                    //       .substring(0, 1),
                                    //   color: customerData.feePening != 0
                                    //       ? Colors.red
                                    //       : null,
                                    // ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              customerData.name.toString(),
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              customerData.categoryType.toString(),
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
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  ),
                                                  Text(
                                                    '(*${customerData.feePending})',
                                                    style: const TextStyle(
                                                        color: Colors.red,
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                          ]),
                                    ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.green
                                    ),
                                   onPressed: (){},
                                   child: const Text("In"))
                                  ]),
                            ),
                          ),
                        ),
                      );
                    });
              }
              if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return const Center(child: CircularProgressIndicator());
            })
            
            );
  }
}
