import 'package:flutter/material.dart';
import 'package:sport/model/customer_list_out.dart';
import 'package:sport/service.dart';

import '../widget/secondery_button.dart';

class OutPage extends StatefulWidget {
  const OutPage({Key? key}) : super(key: key);

  @override
  State<OutPage> createState() => _OutPageState();
}

class _OutPageState extends State<OutPage> {
  late CustomerListOut futureCustomerOut;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text("Out"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 600,
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder<CustomerListOut>(
                future: ServiceCall().fetchCustomerOut(),
                builder: (context, AsyncSnapshot<CustomerListOut> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          CustomerOut data = snapshot.data!.data![index];

                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 5, right: 5, top: 5),
                            child: Card(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Text(
                                            snapshot.data!.data![index].name,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        const SizedBox(height: 3),
                                        if (snapshot
                                                .data!.data![index].feePending >
                                            0)
                                          Row(
                                            children: [
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(left: 20),
                                                child: Text(
                                                  "FeePending",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12),
                                                ),
                                              ),
                                              Text(
                                                '(*${snapshot.data!.data![index].feePending})',
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12,
                                                    color: Colors.red),
                                              )
                                            ],
                                          )
                                      ],
                                    ),
                                  ),
                                  outButton(data)
                                ],
                              ),
                            ),
                          );
                          // return Card(
                          //        shape: RoundedRectangleBorder(
                          //        borderRadius: BorderRadius.circular(15),
                          //        ),
                          //        elevation: 5,
                          //        child: SizedBox(
                          //        height: 100,
                          //        width: 190,
                          //        child: Column(
                          //        children: [
                          //        Row(
                          //         crossAxisAlignment: CrossAxisAlignment.center,
                          //         children: [
                          //           SizedBox(
                          //               height: 40,
                          //               width: 80,
                          //               child: ElevatedButton(
                          //                   style: ElevatedButton.styleFrom(
                          //                       primary: Colors.amber.shade600),
                          //                   onPressed: () {
                          //                     ServiceCall()
                          //                         .attendanceOut(
                          //                             key: data.customerKey)
                          //                         .then((value) {
                          //                       setState(() {});
                          //                     });
                          //                   },
                          //                   child: const Text(
                          //                     "Out",
                          //                     style: TextStyle(
                          //                         fontSize: 16,
                          //                         fontWeight: FontWeight.bold),
                          //                   ),
                          //                  ),
                          //                 ),

                          //           Padding(
                          //             padding: const EdgeInsets.only(top: 10),
                          //             child: Text(
                          //               data.name,
                          //               style: const TextStyle(
                          //                   fontSize: 15,
                          //                   fontWeight: FontWeight.bold),
                          //             ),
                          //            ),
                          //         ],
                          //          ),

                          //        if (snapshot.data!.data![index].feePending > 0)
                          //         Row(
                          //           children: [
                          //             Text(
                          //               "FeeDetail :  ${snapshot.data!.data![index].feePending}",
                          //                   style: const TextStyle(
                          //                   fontWeight: FontWeight.bold,
                          //                   fontSize: 13),
                          //             ),

                          //           ],
                          //           )
                          //        ]),
                          //        ),
                          //       );
                        });
                  }
                  if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return const Center(child: CircularProgressIndicator());
                }),
          ),
        ],
      ),
    );
  }

  outButton(CustomerOut data) {
    bool _isLoading = false;
    return SizedBox(
      height: 60,
      width: 120,
      child: ElevatedButton(
        child: _isLoading ? CircularProgressIndicator() : Text("Out"),
        style: ElevatedButton.styleFrom(primary: Colors.amber.shade600),
        onPressed: () {
          _isLoading = !_isLoading;
          Future.delayed(const Duration(seconds: 2)).then((value) {});
          // _isLoading ? null : _startLoading();
          ServiceCall().attendanceOut(key: data.customerKey).then((value) {
            setState(() {});
          });
        },
      ),
    );
  }
}
