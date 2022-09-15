// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool showFees = false;
  String clickedKey = '';
  @override
  void initState() {
    super.initState();
     _prefs.then((value) {
      showFees = 
      value.getBool(('fees'))!;
      });

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
              if(snapshot.data!.data!.isEmpty){
                return
                  Center(child: FittedBox(child: Text('No Record Available',softWrap: true,style: TextStyle(fontSize: 30,color: Colors.grey,fontWeight: FontWeight.w600),)));
              }
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
                                .then((value) {

                                  
                            ServiceCall()
                                .attendanceOut(data: data)
                                .then((value) {

                              setState(() {});
                            });

                                });

                          },
                          customerData: data,
                          selectedKey: clickedKey,
                          showFees: showFees,);
                    }),
              );
            }
            else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            else{
            return const Center(child: CircularProgressIndicator());}
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
    required this.showFees
  }) : super(key: key);
  final CustomerOut customerData;
  final Function callback;
  final String selectedKey;
  final bool showFees;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        !customerData.isPNP?
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Profile(
                      showFees: showFees,
                      name: customerData.name,
                      customerKey: customerData.customerKey,
                    ))) : const SizedBox();
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      customerData.name.trim(),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                   !customerData.isPNP?
                    Row(children:[
                      Text(
                      customerData.categoryType,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(width: 2),
                    !customerData.isPNP ?
                    const Text("|",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                    ),):
                    const SizedBox(),
                    Text(
                      customerData.batch.toString(),
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w400),
                    ),
                    ],): const SizedBox(),
                    
                    const SizedBox(height: 3),
                    Row(children: [
                      const Text("In :",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.blue
                      ),),
                      Padding(
                        padding: const EdgeInsets.only(left: 3),
                        child: Text(customerData.inTime,
                    style: const TextStyle(
                        fontSize: 12
                    ),),
                      ),
                    ],),
                    //&& showFees
                    const SizedBox(height: 5),
                    !customerData.isPNP?
                     (customerData.feePending != 0 ) ?
                      Row(
                        children:[
                          const Text(
                            "Fee Pending",
                            style: TextStyle(fontSize: 12,color: Colors.red),
                          ),
                          (customerData.feePending != 0 && showFees)?
                          Text(
                            '(*${customerData.feePending})',
                            style: const TextStyle(
                                color: Colors.red,
                                fontSize: 10,
                                fontWeight: FontWeight.w600),
                          ): const SizedBox()
                        ],
                      ): 
                    
                       const SizedBox(): const SizedBox(),
                      const SizedBox(height: 5),
                        customerData.isPNP ?
                       Image.asset('assets/images/pnp.jpeg',
                       scale: 3,): const SizedBox(),
                  ]),
                  ),
                 ),
          InkWell(
            
            onDoubleTap: () => callback(customerData.isPNP==true? customerData.slotId.toString():customerData.customerKey), 
            onTap: () {},
            child: Container(
              width: 80,
              alignment: Alignment.center,
              constraints: const BoxConstraints(maxHeight: 5 * 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 
                customerData.isPNP==true?
                ((selectedKey != customerData.slotId.toString())
                  ? const Text('Out',
                    style: TextStyle(
                    color: Color.fromRGBO(6, 41, 74, 1),
                    fontSize: 32,
                    fontWeight: FontWeight.bold))
                  : const Center(
                child: CircularProgressIndicator(color: Colors.white),))
                :
                  ((selectedKey != customerData.customerKey)
                  ? const Text('Out',
                    style: TextStyle(
                    color: Color.fromRGBO(6, 41, 74, 1),
                    fontSize: 32,
                    fontWeight: FontWeight.bold))
                  : const Center(
                child: CircularProgressIndicator(color: Colors.white),)),
               
               (customerData.totalPlay.toString() == '')? const SizedBox():
               Column(
                 children: [
                   Text(customerData.totalPlay.toString()),
                   const Text("Hr : Min",
                style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold
               ),
             )],
         ), ],
            )
          ),
         ),
       ]),
      ),
    );
  }
  
}

