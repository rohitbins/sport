import 'package:flutter/material.dart';
import 'package:flutter_pie_chart/model/customer_list.dart';
import 'package:flutter_pie_chart/service.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({Key? key}) : super(key: key);

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {

 late  Future<CustomerListData>futureCustomerData;

//  List<CustomerData> customer = [];
//  String? person;


 @override
 void initState(){
// getData();
  super.initState();
  // futureCustomerData = fetchCustomerData();
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer"),
      ),
      body: ListView(
        children: [
          FutureBuilder<CustomerListData>(
            future: futureCustomerData,
            builder: (context, snapshot){
              if (snapshot.hasData){
                
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 30,
                      width: MediaQuery.of(context).size.width,
                      child: Text(snapshot.data!.data!.length.toString()),
                    );
                  });
                  
              }if (snapshot.hasError){
                return Text("${snapshot.error}");
              }
              return const Center(child: CircularProgressIndicator());
            })
        ],
      )
    );
  }

  // void getData () async {
  //   await fetchCustomerData().then((value) => {
  //     customer.addAll(customer.first)
  //   });
  // }
}