import 'package:flutter/material.dart';
import 'package:sport/model/customer_list.dart';
import 'package:sport/pages/profile.dart';

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

  @override
  Widget build(BuildContext context) {
    List<CustomerData> dataList = widget.customerListData.data!;
    return dataList.isEmpty
        ? Center(
            child: Text(
              'Sorry no data found',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20, color: Colors.grey[400], letterSpacing: 2),
            ),
          )
          : ListView.builder(
            shrinkWrap: true,
            itemCount: dataList.length,
            itemBuilder: (BuildContext context, int index) {
              CustomerData customerData = dataList[index];

              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Profile(
                                customerKey: customerData.customerKey!,
                              )));
                },

                 child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      elevation: 6,
                      color: loginin ? Colors.green : Colors.white,
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
                                bottomLeft: Radius.circular(15))
                            ),
                              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:[
                                  Text(customerData.name!.trim(),
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),),
                                  Text(customerData.categoryType!,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey.shade600,
                                        fontWeight: FontWeight.w400),),
                                  Text(customerData.batch.toString(),
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey.shade600,
                                        fontWeight: FontWeight.w400),),
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
                                ],
                             ),
                            ),
                           ),
                           InkWell(
                            onTap: (){
                              setState(() {
                                 loginin = !loginin;
                              });
                              
                             
                            },
                            child: Container(
                              width: 100,
                              alignment: Alignment.center,
                              constraints: const BoxConstraints(maxHeight: 100),
                              child: Text(!loginin ? 'Playing....' : 'In',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.red
                              ),),
                            ),
                           )
                        ],
                      ),
                    ),
                    
                  ],
                 ),
                 
               
              );
              },
            );
  }
}
