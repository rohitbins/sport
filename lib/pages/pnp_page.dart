import 'package:blinking_text/blinking_text.dart';
import 'package:flutter/material.dart';
import 'package:sport/model/pnp_Attendance_in.dart';
import 'package:sport/model/pnp_customer_model.dart';
import 'package:sport/service.dart';

class PnpPage extends StatefulWidget {
  const PnpPage({Key? key}) : super(key: key);
  
  @override
  State<PnpPage> createState() => _PnpPageState();
}

class _PnpPageState extends State<PnpPage> {
  bool isLoading = false;
  final String selectedKey = '';
  // late PnpCustomerModel getPnpCustomerForIn;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pnp"),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<PnpCustomerModel>(
          future: ServiceCall().getPnpCustomerForIn(),
          builder: ((context, snapshot) {
            if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.data!.length,
              itemBuilder: (BuildContext context, int index){
                return Padding(
                  padding: const EdgeInsets.only(left: 6,right: 6),
                  child: Card(
        elevation: 6,
        color:   snapshot.data!.data![index].status.toString().toUpperCase() == "PLAYING" ? Colors.white:           
        Colors.green,
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
                     Text(snapshot.data!.data![index].pnpCustomer.toString(),
                     style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1
                     ),),
                     const SizedBox(height: 5),
                     Text(snapshot.data!.data![index].bookingDate.toString(),
                     style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 12
                     ),),
                     const SizedBox(height: 5),
                     const Text("PNP",
                     style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red
                     ),)
                    ]),
                    ),
                   ),

                     (selectedKey == snapshot.data!.data![index].pnpCustomerId)?const CircularProgressIndicator():  
            snapshot.data!.data![index].status.toString().toUpperCase() == "PLAYING" ? const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: BlinkText(
                            'playing..',
                            duration: Duration(seconds: 1),
                            beginColor: Colors.white,
                            endColor: Colors.green,
                            style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ):           
        InkWell(
            onDoubleTap: () {
              ServiceCall().fetchPnpAttendaneIN(
              pnpCustomerId: snapshot.data!.data![index].pnpCustomerId.toString(), 
              slotId: snapshot.data!.data![index].slotId.toString());
              setState(() {
              });
            },
            onTap: () {}, 
             child: Container(
              width: 80,
              constraints: const BoxConstraints(maxHeight: 4 * 15.0),
              color: Colors.green,
             
              child: const Text("In",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),),
              
            ),
            )
         ]),
  ),        
          
              
            
           
          
       
                );
              });
         }else if(snapshot.hasError){
          return Text(snapshot.error.toString());
         }
         else{
          return const Center(child: CircularProgressIndicator());
         } })),
      ),
    );
  }
}