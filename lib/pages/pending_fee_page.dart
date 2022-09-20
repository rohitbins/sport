// ignore_for_file: prefer_interpolation_to_compose_strings, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:sport/pages/profile/profile.dart';
import 'package:sport/service.dart';
import 'package:sport/utils/constants.dart';
import '../model/pending_customer_fee.dart';

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
      appBar: AppBar(
          centerTitle: true,
          title: Text(widget.Member.toString()+' Pending Fee')
          ),
           body: FutureBuilder<PendingFeeGuru>(
        future: ServiceCall().fetchPendingFeeData(widget.Member),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                  for(var i in snapshot.data!.data!)
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Profile(
                                  showFees: ShowFee,
                                  name: i.name.toString(),
                                  customerKey: i.customerKey.toString(),
                                )));
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 4,
                                spreadRadius: 1,
                                offset: Offset(2, 2),
                              )
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                      child: Row(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:  const EdgeInsets.only(bottom: 5),
                                child: Text(i.name.toString(),style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                              ),
                              if(i.feeDate!=null)
                                Row(
                                  children: [
                                    Text(i.feeDate.toString(),style: const TextStyle(color: Colors.grey,fontWeight: FontWeight.w500),),
                                    const SizedBox(width: 5),
                                    Text('('+(i.pendingDays!*-1).toString()+')',style: const TextStyle(fontSize:14,color: Colors.orange,fontWeight: FontWeight.w500),),
                                  ],
                                ),
                              if(i.feetext!=null)
                                Text(i.feetext.toString(),style: const TextStyle(color: Colors.grey,fontWeight: FontWeight.w500),)
                            ],
                          ),
                        ),
                        Column(children: [Text(i.fee.toString(),style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.red),)],)
                      ],)
                      ),
                    ),
                   const SizedBox(height: 50)
                  ],
                ),
              );
          }
          else if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()));
          }
          else{ return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
