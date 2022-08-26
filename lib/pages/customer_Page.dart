import 'package:blinking_text/blinking_text.dart';
import 'package:flutter/material.dart';
import 'package:sport/model/customer_list.dart';
import 'package:sport/pages/profile/profile.dart';
import 'package:sport/utils/constants.dart';

import '../service.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({Key? key, required this.customerListData})
      : super(key: key);
  final CustomerListData customerListData;

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

bool loginin = false;

class _CustomerPageState extends State<CustomerPage>
    with SingleTickerProviderStateMixin {
  String lable = '';
  String clickedKey = '';
  @override
  Widget build(BuildContext context) {
    List<CustomerData>? dataList = widget.customerListData.data;
    return dataList == null
        ? const Center(child: CircularProgressIndicator())
        : Padding(
            padding: const EdgeInsets.only(bottom: 63),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: dataList.length,
                itemBuilder: (BuildContext context, int index) {
                  CustomerData customerData = dataList[index];

                  return InCard(
                    customerData: customerData,
                    selectedKey: clickedKey,
                    callback: (String _kay) {
                      setState(() {
                        lable = 'wait...';
                        clickedKey = _kay;
                      });
                      ServiceCall()
                          .attendanceIn(customerKey: customerData.customerKey!)
                          .then((value) {
                        customerData.isPlaying = 15;
                        clickedKey = '';
                        setState(() {});
                      });
                    },
                  );
                }),
          );
  }
}

class InCard extends StatelessWidget {
  const InCard({
    Key? key,
    required this.customerData,
    required this.callback,
    required this.selectedKey,
    this.colors,
  }) : super(key: key);
  final CustomerData customerData;
  final Function callback;
  final String selectedKey;

  final Color? colors;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Profile(
                      name: customerData.name!,
                      customerKey: customerData.customerKey!,
                    )));
      },
      child: Card(
        elevation: 6,
        color: customerData.isPlaying! > 0 ? Colors.white : colors ?? myBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // if you need this
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
                      customerData.name!.trim(),
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
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
              width: customerData.isPlaying! > 0 ? 120 : 80,
              alignment: Alignment.center,
              constraints: const BoxConstraints(maxHeight: 4 * 15.0),
              child: (selectedKey == customerData.customerKey)
                  ? const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    )
                  : customerData.isPlaying! > 0
                      ? const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: BlinkText(
                            'playing..',
                            duration: Duration(seconds: 1),
                            beginColor: Colors.green,
                            endColor: Color.fromRGBO(6, 41, 74, 1),
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        )
                      : const Text('in',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold)),
            ),
          )
        ]),
      ),
    );
  }
}
