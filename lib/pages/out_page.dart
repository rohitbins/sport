// ignore_for_file: dead_code

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
                               return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                     Card(
                                      elevation: 6,
                                      color: Colors.amber,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        side: BorderSide(
                                          color: Colors.grey.withOpacity(0.2),
                                          width: 1,
                                        )
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                 color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(15),
                                                  bottomLeft: Radius.circular(15)
                                                )
                                              ),
                                             
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children:[
                                                    Text(snapshot.data!.data![index].name,
                                            style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),),

                                                 const SizedBox(height: 3),
                                                 if(snapshot.data!.data![index].feePending > 0)
                                                 Row(
                                                  children: const[
                                                    Text("FeePending",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 12
                                                    ),),

                                                    // Text('(*${snapshot.data!.data![index].feePending})')
                                                  ],
                                                 )
                                                 
                                                  ],
                                         ),
                                        ),
                                       ),
                                       ),
                                        outButton(data)
                                        ],
                                        
                                      ),
                                      
                                     )
                                ],
                               );
                          // return Padding(
                          //   padding: const EdgeInsets.only(
                          //       left: 5, right: 5, top: 5),
                          //   child: Card(
                          //     child: Row(
                          //       children: [
                          //         Expanded(
                          //           child: Column(
                          //             crossAxisAlignment:
                          //                 CrossAxisAlignment.start,
                          //             children: [
                          //               Padding(
                          //                 padding:
                          //                     const EdgeInsets.only(left: 20),
                          //                 child: Text(
                          //                   snapshot.data!.data![index].name,
                          //                   style: const TextStyle(
                          //                       fontSize: 18,
                          //                       fontWeight: FontWeight.bold),
                          //                 ),
                          //               ),
                          //               const SizedBox(height: 3),
                          //               if (snapshot
                          //                       .data!.data![index].feePending > 0)
                          //                 Row(
                          //                   children: [
                          //                     const Padding(
                          //                       padding:
                          //                           EdgeInsets.only(left: 20),
                          //                       child: Text(
                          //                         "FeePending",
                          //                         style: TextStyle(
                          //                             fontWeight:
                          //                                 FontWeight.bold,
                          //                             fontSize: 12),
                          //                       ),
                          //                     ),
                          //                     Text(
                          //                       '(*${snapshot.data!.data![index].feePending})',
                          //                       style: const TextStyle(
                          //                           fontWeight: FontWeight.bold,
                          //                           fontSize: 12,
                          //                           color: Colors.red),
                          //                     )
                          //                   ],
                          //                 )
                          //             ],
                          //           ),
                          //         ),
                                  outButton(data);
                          //       ],
                          //     ),
                          //   ),
                          // );
                         
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
      child: InkWell(
        child: _isLoading ? const Center(child: CircularProgressIndicator()) : const Center(child: Text("Out",
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),)),
        
        onTap: () {
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
