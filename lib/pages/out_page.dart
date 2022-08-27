// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:sport/model/customer_list_out.dart';
import 'package:sport/service.dart';
import 'package:sport/utils/constants.dart';
import 'profile/profile.dart';

class OutPage extends StatefulWidget {
  const OutPage({Key? key}) : super(key: key);

  @override
  State<OutPage> createState() => _OutPageState();
}

class _OutPageState extends State<OutPage> {
  late CustomerListOut futureCustomerOut;

  String clickedKey = '';
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
      body: FutureBuilder<CustomerListOut>(
          future: ServiceCall().fetchCustomerOut(),
          builder: (context, AsyncSnapshot<CustomerListOut> snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      CustomerOut data = snapshot.data!.data![index];

                      return OutCard(
                          callback: (_val) {
                            setState(() {
                              clickedKey = _val;
                            });
                            Future.delayed(const Duration(seconds: 2))
                                .then((value) {});

                            ServiceCall()
                                .attendanceOut(key: data.customerKey)
                                .then((value) {
                              setState(() {});
                            });
                          },
                          customerData: data,
                          selectedKey: clickedKey);
                    }),
              );
            }
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }

  outButton(CustomerOut data) {
    return SizedBox(
      height: 60,
      width: 120,
      child: ElevatedButton(
        child: Text("Out"),
        style: ElevatedButton.styleFrom(primary: Colors.amber.shade600),
        onPressed: () {},
      ),
    );
  }
}

class OutCard extends StatelessWidget {
  const OutCard({
    Key? key,
    required this.customerData,
    required this.callback,
    required this.selectedKey,
  }) : super(key: key);
  final CustomerOut customerData;
  final Function callback;
  final String selectedKey;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Profile(
                      name: customerData.name,
                      customerKey: customerData.customerKey,
                    )));
      },
      child: Card(
        elevation: 6,
        color: customerData.isPlaying > 0 ? Colors.white : myYellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: Colors.grey.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Row(children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      customerData.name.trim(),
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Row(children:[
                      Text(
                      customerData.categoryType,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(width: 2),
                    const Text("|",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                    ),),
                    const SizedBox(width: 2),
                    Text(
                      customerData.batch.toString(),
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w400),
                    ),
                    ],),
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
                      )
                    else
                      const Text(''),
                  ]),
            ),
          ),
          InkWell(
            onDoubleTap: () => callback(customerData.customerKey),
            onTap: () {},
            child: Container(
              width: 80,
              alignment: Alignment.center,
              constraints: const BoxConstraints(maxHeight: 4 * 15.0),
              child: (selectedKey != customerData.customerKey)
                  ? const Text('Out',
                      style: TextStyle(
                          color: Color.fromRGBO(6, 41, 74, 1),
                          fontSize: 32,
                          fontWeight: FontWeight.bold))
                  : const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    ),
            ),
          ),
        ]),
      ),
    );
  }
}
