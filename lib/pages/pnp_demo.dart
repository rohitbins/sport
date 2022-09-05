import 'package:flutter/material.dart';
import 'package:sport/model/pnp_customer_model.dart';
import 'package:sport/service.dart';


class PnpDemo extends StatefulWidget {
  const PnpDemo({Key? key}) : super(key: key);

  @override
  State<PnpDemo> createState() => _PnpDemoState();
}

class _PnpDemoState extends State<PnpDemo> {
  // PnpCustomerModel futurePnpCustomerModel = PnpCustomerModel();

  // void initState (){
  //   super.initState();
  //    futurePnpCustomerModel = futurePnpCustomerModel;
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PnpDemo"),
        centerTitle: true,
      ),
      body: FutureBuilder<PnpCustomerModel>(
        future: ServiceCall().fetchPnpCustomerModel(),
        builder: (context, snapshot){
          if (snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.data!.length,
              itemBuilder: (BuildContext context, int index){
                return Card(
                  child: Row(
                    children: [
                    Expanded(
                      child: Container(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(snapshot.data!.data![index].pnpCustomer.toString()),
                        Text(snapshot.data!.data![index].pnpCustomerId.toString()),
                        Text(snapshot.data!.data![index].pnpCustomer.toString()),
                        Text(snapshot.data!.data![index].pnpCustomerId.toString()),
                      ],
                                      ),
                      ),
                    ),
                    InkWell(
                      child: Container(
                       constraints: const BoxConstraints(maxHeight: 4.5 * 15.0),
                        width: 70,
                        color: Colors.green,
                        child: Text(snapshot.data!.data![index].status.toString()),
                      ),
                    )
                  ],)
                  
                );
              });
          } if (snapshot.hasError){
            return Text(snapshot.error.toString());
          }
          return const Center(child: CircularProgressIndicator(),);
        }),
    );
  }
}





class PnpIn2 extends StatelessWidget {
  const PnpIn2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}