import 'package:flutter/material.dart';

class SportInfo extends StatelessWidget {
  const SportInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SportsInfo"),
        centerTitle: true,
      ),
      body: Column(
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
    );
  }
}