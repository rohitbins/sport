import 'package:flutter/material.dart';
import 'package:sport/model/attendance.dart';
import 'package:sport/model/payment.dart';
import 'package:sport/service.dart';
import 'package:intl/intl.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
String hexColor(String _colorhexcode) {
  String colornew1 = '0xff' + _colorhexcode;
  colornew1 = colornew1.replaceAll('#', '');
  return colornew1;
}

 
  // late Future<AttendanceList> futureAttendance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // initialIndex: 0,
      length: 4, 
      child: Scaffold(
        resizeToAvoidBottomInset:true,
        appBar: AppBar(
          title: const Text("Profile"),
          centerTitle: true,
          bottom:  const TabBar(
            labelStyle: TextStyle(
              fontSize: 11
            ),
            tabs: [
              Tab(text: "Personal Info"),
              Tab(text: "SportsInfo"),
              Tab(text: "Attendence"),
              Tab(text: "FeeDetail",)
              ]
         ),
        ),
        body:  TabBarView(
          children: [
            Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 5),
          child: Row(
            children:[
              const Icon(Icons.person,
              size: 30,),
              const SizedBox(width: 30),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: const[
                 Text("Name :",
                 style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                 ),
                ),
                Text("Mayank")
               ],
             ),
            ],
          ),
        ),
         const SizedBox(height: 3),
         const Divider(
          thickness: 1.5,
          color: Colors.grey,
        ),
         Padding(
           padding: const EdgeInsets.only(left: 20, top:3),
           child: Row(
            children: [
              const Icon(Icons.phone,
              size: 30,),
              const SizedBox(width: 30),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: const [
                 Text("Contact No :",
                 style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                 ),
                ),
                Text("999999999")
               ],
             ),
            ],
          ),
         ),
         const SizedBox(height: 5),
         const Divider(
          thickness: 1.5,
          color: Colors.grey,
        ),
         Padding(
           padding: const EdgeInsets.only(left: 20, top: 3),
           child: Row(
            children:[
              const Icon(Icons.calendar_today,
              size: 30),
              const SizedBox(width: 30),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: const[
                 Text("Date of Birth :",
                 style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                 ),
                ),
                Text("date of birth")
               ],
             ),
            ],
           ),
          ),
         const SizedBox(height: 5,),
         const Divider(
          thickness: 1.5,
          color: Colors.grey,
        ),
         Padding(
           padding: const EdgeInsets.only(left: 20,top: 3),
           child: Row(
            children:[
              const Icon(Icons.person,
              size: 30,),
              const SizedBox(width: 30),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: const [
                 Text("Father's Name :",
                 style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                 ),
                ),
                Text("Papa")
               ],
             ),
            ],
           ),
          ),
         const SizedBox(height: 5,),
         const Divider(
          thickness: 1.5,
          color: Colors.grey,
        ),
         Padding(
           padding: const EdgeInsets.only(left: 20, top: 3),
           child: Row(
            children: [
              const Icon(Icons.email,
              size: 30),
              const SizedBox(width: 30),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: const[
                 Text("Email :",
                 style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                 ),
                ),
                Text("email")
               ],
             ),
            ],
           ),
          ),
         const SizedBox(height: 5,),
         const Divider(
          thickness: 1.5,
          color: Colors.grey,
        ),
         Padding(
           padding: const EdgeInsets.only(left: 20,top: 3),
           child: Row(
            children: [
              const Text("M/F",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),),
             const SizedBox(width: 30),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: const[
                 Text("Gender :",
                 style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                 ),
                ),
                Text("Male")
               ],
             ),
            ],
           ),
          ),
         const SizedBox(height: 5,),
         const Divider(
          thickness: 1.5,
          color: Colors.grey,
        ),
         Padding(
           padding: const EdgeInsets.only(left: 20,top: 3),
           child: Row(
            children: [
              const Icon(Icons.home,
              size: 35,),
              const SizedBox(width: 30),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: const[
                 Text("Address :",
                 style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                 ),
                ),
                Text("Address")
               ],
             ),
            ],
           ),
          ),
         const SizedBox(height: 5,),
         const Divider(
          thickness: 1.5,
          color: Colors.grey,
        ),
         Padding(
           padding: const EdgeInsets.only(left: 20,top: 3),
           child: Row(
            children:[
              const Icon(Icons.holiday_village,
              size: 35,),
             const SizedBox(width: 30),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: const [
                 Text("State :",
                 style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                 ),
                ),
                Text("State")
               ],
             ),
            ],
           ),
          ),
         const SizedBox(height: 5,),
         const Divider(
          thickness: 1.5,
          color: Colors.grey,
        ),
         Padding(
           padding: const EdgeInsets.only(left: 20, top:3),
           child: Row(
            children:[
              const Icon(Icons.location_city,
              size: 35,),
             const  SizedBox(width: 30),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: const[
                 Text("City :",
                 style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                 ),
                ),
                Text("City")
               ],
             ),
            ],
          ),
         ),
         const SizedBox(height: 5,),
         const Divider(
          thickness: 1.5,
          color: Colors.grey,
        ),
         Padding(
           padding: const EdgeInsets.only(left: 20, top: 3),
           child: Row(
            children: [
             const Icon(Icons.boy,
              size: 35,),
             const SizedBox(width: 30),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children:const [
                 Text("PinCode :",
                 style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                 ),
                ),
                Text("22222")
               ],
             ),
            ],
           ),
          ),
         const SizedBox(height: 5,),
         const Divider(
          thickness: 1.5,
          color: Colors.grey,
        ),
      ],
    ),
  
             Column(
        children: [
            Row(
              children:[
               const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child:Icon(Icons.calendar_month),
                ),
                 const SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Text("Date of joining",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  SizedBox(height: 2),
                  Text("yyyy-mm-dd")
                ],
              ),
              ],
            ),
           const Divider(thickness: 1.5,
           color: Colors.black),

           Row(
              children:[
               const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child:Icon(Icons.sports),
                ),
                 const SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Text("Sport",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  SizedBox(height: 2),
                  Text("Sport")
                ],
              ),
              ],
            ),
           const Divider(thickness: 1.5,
           color: Colors.black),

           Row(
              children:[
               const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child:Icon(Icons.merge_type),
                ),
                 const SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Text("Type",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  SizedBox(height: 2),
                  Text("Type")
                ],
              ),
              ],
            ),
           const Divider(thickness: 1.5,
           color: Colors.black),

           Row(
              children:[
               const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child:Icon(Icons.category),
                ),
                 const SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Text("Category",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  SizedBox(height: 2),
                  Text("Category")
                ],
              ),
              ],
            ),
           const Divider(thickness: 1.5,
           color: Colors.black),

           Row(
              children:[
               const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child:Icon(Icons.batch_prediction),
                ),
                 const SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Text("Batch",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  SizedBox(height: 2),
                  Text("Batch")
                ],
              ),
              ],
            ),
           const Divider(thickness: 1.5,
           color: Colors.black),

           Row(
              children:[
               const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child:Icon(Icons.payment),
                ),
                 const SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Text("Fee Type",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  SizedBox(height: 2),
                  Text("Fee Type")
                ],
              ),
              ],
            ),
           const Divider(thickness: 1.5,
           color: Colors.black),

           Row(
              children:[
               const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child:Icon(Icons.calendar_month),
                ),
                 const SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Text("Speciality",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  SizedBox(height: 2),
                  Text("Speciality")
                ],
              ),
              ],
            ),
           const Divider(thickness: 1.5,
           color: Colors.black),
           
           Row(
              children:[
               const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child:Icon(Icons.time_to_leave),
                ),
                 const SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Text("Start Time",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  SizedBox(height: 2),
                  Text("Hr-Min_Sec")
                ],
              ),
              ],
            ),
           const Divider(thickness: 1.5,
           color: Colors.black),

           Row(
              children:[
               const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child:Icon(Icons.currency_rupee),
                ),
                 const SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Text("Total Fee",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  SizedBox(height: 2),
                  Text("Payment")
                ],
              ),
              ],
            ),
           const Divider(thickness: 1.5,
           color: Colors.black),

           Row(
              children:[
               const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child:Icon(Icons.discount),
                ),
                 const SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Text("Discount",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  SizedBox(height: 2),
                  Text("Discount")
                ],
              ),
              ],
            ),
           const Divider(thickness: 1.5,
           color: Colors.black),
            Row(
              children:[
               const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child:Icon(Icons.currency_rupee_sharp),
                ),
                 const SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Text("Final Fee",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                 ),
                  SizedBox(height: 2),
                  Text("Payment")
                ],
              ),
              ],
            ),
             const Divider(thickness: 1.5,
           color: Colors.black),
        ],
      ),
    
              FutureBuilder<List<Attendance>?>(
                future: ServiceCall().fetchAttendance(),
                builder: (context, snapshot) {
                  if (snapshot.hasData){ 
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index){
                         return attendanceCard(snapshot.data![index]);
                      });
                  }else if (snapshot.hasError){
                    return Text("${snapshot.error}");
                  }
                  return const Center(child: CircularProgressIndicator());
                },
                ),
                 FutureBuilder<List<Payment>?>(
                  future: ServiceCall().fetchPayment(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData){
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return paymentCard(snapshot.data![index]);
                        });
                    }else if (snapshot.hasError){
                      return Text("${snapshot.error}");
                    }
                    return const Center(child: CircularProgressIndicator());
                  })
          ],
        ),
       ),
      );
    }
  
  Widget attendanceCard(Attendance _attendance) {
    List<String> duration = [];
    DateFormat dateFormat = DateFormat("dd\nMMM");
duration = _attendance.duration.replaceAll('hr', '').replaceAll('min', '').split(' ');
    return Padding(
      padding: const EdgeInsets.only(left: 6,right: 6),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        elevation: 4,
        child:Row(children: [ 
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 2,vertical: 4),
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
            decoration: BoxDecoration(color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(dateFormat.format(
                DateTime.parse(_attendance.inDate)).toString(),
                // textAlign: TextAlign.center,
                style:TextStyle(
                fontSize: 20,
                color: Color(int.parse(hexColor(_attendance.dateBGColorHEX)))
        ),
       ),
      ),
   ),
          ),
      const SizedBox(width:20),
        
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Row(children: [
            Text('In    : ',style: TextStyle(fontSize:15,color: Color(int.parse(hexColor(_attendance.inColorHEX)))),),
            Text(_attendance.inText,
            style: TextStyle(color: Color(int.parse(hexColor(_attendance.inColorHEX))),
            fontSize: 18,fontWeight: FontWeight.bold,),)],),
          Row(children: [
            Text('Out : ',
            style: TextStyle(fontSize:15,color: Color(int.parse(hexColor(_attendance.outColorHEX)))),),
            Text(_attendance.inText,
            style: TextStyle(color: Color(int.parse(hexColor(_attendance.outColorHEX))),fontSize: 18,fontWeight: FontWeight.bold),
            ),
            ],
          ),
       ],),

      const  SizedBox(width: 50),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(duration.first,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900]
                ),
                ),
                const SizedBox(width: 5),
                const Text(':'),
                const SizedBox(width: 5),
                Text(duration.last,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900]
                ),
                )
              ],
            ),
            Row(
              children: [
                const SizedBox(width: 5),
                Text("Hr",style: TextStyle(
                  fontSize: 12,
                  color: Colors.blue[800]
                ),
               ),
               const SizedBox(width: 10),
               Text("Min",style: TextStyle(
                fontSize: 12,
                color: Colors.blue[800]
               ),)
              ],
               )
          ],
           )
        ],)
        ),
    );
  }
}

Widget paymentCard(Payment payment) {
  List<String> player = [];
  DateFormat dateFormat = DateFormat("dd\nMMM");

  return Padding(
    padding: const EdgeInsets.only(left: 6,right: 6),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      elevation: 4,
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 2,vertical: 4),
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey
            ),
              child: Center(
                child: Text(dateFormat.format (
                DateTime.parse(payment.date)),
                style: TextStyle(
                fontSize: 20,
                color: Color(int.parse(hexColor(payment.dateBGColorHex))) 
           ),
          ),
              ),
       ),
        ),
       const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(payment.firstText, 
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(int.parse(hexColor(payment.firstTextColorHex)))
                ),),
                Text(payment.secondTextText,
                style: TextStyle(
                fontSize: 11,
                color: Color(int.parse(hexColor(payment.secondTextColorHex)))
              ),
              )
              ],
                  ),
          ),
       Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 50,bottom: 20),
              child: Text(payment.amount.toString(),
              style: TextStyle(
                fontSize:20,
                fontWeight: FontWeight.bold,
                color: Color(int.parse(hexColor (payment.amountColorHEX)))
              ),),
            )
          ],
        ))
    ],),
     ),
  );
}

String hexColor(String colorhexcode) {
  String colornew = '0xff' + colorhexcode;
  colornew = colornew.replaceAll('#', '');
  return colornew;
}