import 'package:flutter/material.dart';

import 'package:pie_chart/pie_chart.dart';


class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  Map<String, double> dataMap = {
    "Hindi": 75.8,
    "English": 85,
    "Science": 45,
    
  };

   List <Color> colorList =[
    const Color(0xffD9FA59),
    const Color(0xff08Fa52),
    const Color(0xff356a2A),
   
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: Container(
      //   height: 60,
      //   width: MediaQuery.of(context).size.width,
      //   color: Colors.orange,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       ElevatedButton(onPressed: (() {
              
      //       }), child: const Text("In")),

      //       ElevatedButton(onPressed: (() {
      //         // Navigator.push(context, MaterialPageRoute (builder: (context) => const DownPage(),));
      //       }), 
      //       style: ElevatedButton.styleFrom(
      //         shape: const CircleBorder()
      //       ),
      //       child: const Text("Ok")),

      //       ElevatedButton(onPressed: (() {
              
      //       }), 
      //       style: ElevatedButton.styleFrom(
      //         primary: Colors.green
      //       ),
      //       child: const Text("In")),

      //       ElevatedButton(onPressed: (() {
              
      //       }),
      //       style: ElevatedButton.styleFrom(
      //         primary: const Color.fromARGB(255, 112, 89, 18)
      //       ),
      //        child: const Text("Out"))
      //     ],
      //   ),
      // ),

      appBar: AppBar(
        title: const Text("Dashboard"),
        centerTitle: true,
      ),
      body:Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const[
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      spreadRadius: 3,
                      offset: Offset(2,2)
                    )
                  ]
                ),
                child: Card(
                  shadowColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                 child:  Row(
                 
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 65,vertical: 30),
                      child: Card(
                        child: SizedBox(
                          height: 50,
                          width: 90,
                          child: ElevatedButton(onPressed: (() {
                            
                          }), 
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green
                          ),
                          child: const Text("In",
                          style: TextStyle(
                            fontSize: 20
                          ),)),
                        ),
                      ),
                    ),
              
                    const Padding(
                      padding:EdgeInsets.only(left:20, bottom: 26),
                      child:Text("Last Out",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),),
                    )
                  ],
                ),
               ),
              ),
            ),
              const SizedBox(height:8),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
              height: 240,
              width: 380,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
               boxShadow: const[
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10,
                    spreadRadius: 3,
                    offset: Offset(2,2)
                  )
               ]
             ),

             child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
              ),
               child: Column(
                  children:  [
                   const Padding(
                     padding: EdgeInsets.only(right: 138, top: 6),
                     child: Text("Month & Date",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),),
                   ),
                   const SizedBox(height: 10),
                  
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: PieChart(
                            dataMap: dataMap,
                            colorList: colorList,
                            chartRadius: MediaQuery.of(context).size.width / 3,
                            legendOptions: const LegendOptions(
                              showLegends: true,
                            ),
                            ),
                    ),
                         const SizedBox(height: 6),
                         const Padding(
                            padding: EdgeInsets.only(right: 138),
                            child: Text("Total Activity Time",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                            ),),
                          ),
                     ],
               ),
             ),
            ),
                ),
            const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 120,
                          width: 380,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const[
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 10,
                                spreadRadius: 3,
                                offset: Offset(2,2)
                              )
                            ]
                          ),

                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                            ),
                          child: const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text("Fees",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                            ),),
                          ),
                          )
                        ),
                      )
            ]),
       ),
      );
      
    
  }
}