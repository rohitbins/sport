import 'package:blinking_text/blinking_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport/model/pnp_customer_model.dart';
import 'package:sport/service.dart';



class PnpPage extends StatefulWidget {
  const PnpPage({Key? key,}) : super(key: key);
  // final PnpCustomerModel pnpCustomerModel;
  
  @override
  State<PnpPage> createState() => _PnpPageState();
}

class _PnpPageState extends State<PnpPage> with SingleTickerProviderStateMixin{

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final String selectedKey = '';
  String clickedKey = '';
  
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        
        title: const Text("PNP"),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<PnpCustomerModel>(
          future: ServiceCall().fetchPnpCustomerModel(),
          builder: ((context, snapshot) {
             if(snapshot.hasData){
               if(snapshot.data!.data!.isEmpty){
                 return
                   Center(child: FittedBox(child: Text('No Record Available',softWrap: true,style: TextStyle(fontSize: 30,color: Colors.grey,fontWeight: FontWeight.w600),)));
               }
               else
               {
                 return ListView.builder(
                     itemCount: snapshot.data!.data!.length,
                     itemBuilder: (BuildContext context, int index){
                       return Padding(
                         padding: const EdgeInsets.only(left: 6,right: 6),
                         child: Card(
                           elevation: 6,
                           color: snapshot.data!.data![index].status.toString().toUpperCase() == 'PLAYING' ? Colors.white:
                           snapshot.data!.data![index].status.toString().toUpperCase() == 'CANCELLED' ? Colors.white:
                           snapshot.data!.data![index].status.toString().toUpperCase() == 'PLAYED' ? Colors.white : Colors.green,
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
                                       Row(
                                         children: [
                                           Flexible(
                                             child: Padding(
                                               padding:  EdgeInsets.only(top: 3),
                                               child: FittedBox(

                                                 child: Text(snapshot.data!.data![index].pnpCustomer.toString(),softWrap: true,
                                                   style: const TextStyle(
                                                       fontSize: 20,
                                                       fontWeight: FontWeight.bold,
                                                       letterSpacing: 1
                                                   ),),
                                               ),
                                             ),
                                           ),
                                           SizedBox(width: 5),
                                           Image.network(snapshot.data!.data![index].sportLogo.toString(),scale: 3.5,),
                                         ],
                                       ),
                                       const SizedBox(height: 2),
                                       Row(
                                         mainAxisAlignment: MainAxisAlignment.start,
                                         children: [
                                           Text(snapshot.data!.data![index].phone.toString(),
                                             style: const TextStyle(
                                                 color: Colors.grey
                                             ),),
                                           Text(' | '),
                                           Flexible(
                                             child: Text(snapshot.data!.data![index].facilityName.toString(),
                                               style:  TextStyle(
                                                   fontWeight: FontWeight.w600,
                                                   color: Colors.yellow[900]
                                               ),),
                                           ),
                                           Text(' | '),
                                           Flexible(
                                             child: Text(snapshot.data!.data![index].pnpFee.toString(),
                                               style:  TextStyle(
                                                   fontWeight: FontWeight.w600,
                                                   color: Colors.yellow[800]
                                               ),),
                                           ),
                                         ],
                                       ),
                                       const SizedBox(height: 2),
                                       Row(
                                         children: [
                                           Text(DateFormat("MMM d, h:mm a")
                                               .format(DateTime.parse(snapshot.data!.data![index].bookingDate.toString())),
                                             style: const TextStyle(
                                                 fontSize: 12,
                                                 color: Colors.grey,
                                                 fontWeight: FontWeight.w500
                                             ),),
                                           const SizedBox(width: 20),
                                           Padding(
                                             padding: const EdgeInsets.only(bottom: 3),
                                             child: Image.asset("assets/images/pnp.jpeg",
                                               scale: 3,
                                             ),
                                           )],
                                       ),
                                     ]),
                               ),
                             ),


                             (selectedKey == snapshot.data!.data![index].status) ? const Center(
                               child: CircularProgressIndicator(color: Colors.white),
                             ): snapshot.data!.data![index].status.toString().toUpperCase() == 'PLAYING'  ?
                             const Padding(
                               padding: EdgeInsets.only(right: 10),
                               child: BlinkText(
                                 "Playing...",
                                 duration: Duration(seconds: 1),
                                 beginColor: Colors.white,
                                 endColor: Colors.green,
                                 style: TextStyle(
                                     fontSize: 18
                                 ),
                               ),
                             ) : snapshot.data!.data![index].status.toString().toUpperCase() == 'CANCELLED' ?
                             const Padding(
                               padding: EdgeInsets.only(right: 5),
                               child: Text("Cancelled",
                                 style: TextStyle(
                                     fontSize: 16,
                                     letterSpacing: 1,
                                     color: Colors.red,
                                     fontWeight: FontWeight.bold
                                 ),
                               ),
                             ) : snapshot.data!.data![index].status.toString().toUpperCase() == 'PLAYED' ?
                             const Padding(
                               padding: EdgeInsets.only(right: 25),
                               child: Text("Played",
                                 style: TextStyle(
                                     fontSize: 16,
                                     letterSpacing: 1,
                                     color: Colors.grey,
                                     fontWeight: FontWeight.bold
                                 ),
                               ),
                             ) : InkWell(
                                 onDoubleTap: () {

                                   ServiceCall().fetchPnpAttendaneIN(
                                       pnpCustomerId: snapshot.data!.data![index].pnpCustomerId.toString(),
                                       slotId: snapshot.data!.data![index].slotId.toString()).then((value) {
                                     snapshot.data!.data![index].status = 'Playing';
                                     clickedKey = '';
                                   });
                                   // print(snapshot.data!.data![index].phone);
                                   setState(() {
                                   });
                                 },
                                 onTap: () {

                                 },

                                 child: Container(
                                     decoration: const BoxDecoration(
                                         borderRadius: BorderRadius.only(
                                             topRight: Radius.circular(15),
                                             bottomRight: Radius.circular(15)
                                         )
                                     ),
                                     width: snapshot.data!.data![index].status == 'Playing' 'Cancelled' 'Played' ? 120 :100,
                                     alignment: Alignment.center,
                                     constraints: const BoxConstraints(maxHeight: 4.5 * 15.0),
                                     child: const Text("In",
                                       style: TextStyle(
                                           fontSize: 32,
                                           letterSpacing: 1,
                                           color: Colors.white,
                                           fontWeight: FontWeight.bold
                                       ),
                                     )

                                 )
                             )]
                           ),
                         ),
                       );
                     });
               }
         }
         else{
          return const Center(child: CircularProgressIndicator());
   } })),
      ),
     );
       
  }
}        
            
    
          
       
 