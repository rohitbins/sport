import 'package:flutter/material.dart';
import 'package:sport/model/pending_customer_fee.dart';
import 'package:sport/service.dart';


class PendingFeeList extends StatefulWidget {
   PendingFeeList({Key? key,required this.Member}) : super(key: key);

  String Member;

  @override
  State<PendingFeeList> createState() => _PendingFeeListState();
}

class _PendingFeeListState extends State<PendingFeeList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<PendingFeeGuru>(
        future: ServiceCall().fetchPendingFeeData(widget.Member),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.data.length,
              itemBuilder: (BuildContext context, int index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.amber.shade100,
                    height: 60,
                    width: 300,
                    child: Column(
                      children: [
                        Text(snapshot.data!.data[index].fee.toString()),
                        Text(snapshot.data!.data[index].feeText.toString())
                      ],
                    ),
                  ),
                );
              });
              // SingleChildScrollView(
              //   scrollDirection: Axis.vertical,
              //   child: Column(
              //     children: [
              //     for(var i in snapshot.data!.data)
              //       Container(
              //       child: Text(snapshot.data!.data[index].fee.toString())
              //       ),
              //     ],
              //   ),
              // );
          }
          else if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()));
          }
          else{ return const CircularProgressIndicator();}
        },
      ),
    );
  }
}
