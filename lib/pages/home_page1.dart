

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  State<HomePage1> createState() => _HomePage1State();
}


class _HomePage1State extends State<HomePage1> {

  Map<String, double> dataMap = {
    "Hindi": 75.8,
    "English": 85,
    "Science": 45,
    // "Math": 68,
    "Drawing": 79.23
  };

  List <Color> colorList =[
    const Color(0xffD9FA53),
    const Color(0xff08Fa52),
    const Color(0xff356a2A),
    // const Color(0xff08fa56),
    const Color(0xffFA4Af8)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
             appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                        height: 90,
                          width: 130,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black
                            )
                          ),
                          child: Column(
                              children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 50,top: 6),
                                child: Text("Previous",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),),
                              ),
                              const SizedBox(height: 4),

                               const Padding(
                                padding: EdgeInsets.only(right: 25),
                                child: Text("6:00PM-8:00PM",
                                style: TextStyle(
                                  fontSize: 12
                                ),
                               ),
                              ),
                              const SizedBox(height: 5),
                            Container(
                              height: 40,
                              width: 130,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 222, 209, 171),
                                border: Border(
                                  top: BorderSide(
                                    color: Colors.black,
                                  )
                                )
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: const[
                                  Text("10",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.green
                                  ),
                                 ),
                                   Text("10",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.red
                                  ),
                                 ),
                                ],
                              ),
                            )

                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          height: 90,
                          width: 130,
                         decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black
                          )
                         ),
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 80,top: 6),
                                child: Text("Next",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                                ),),
                              ),
                               const SizedBox(height: 4),
                              const Padding(
                                padding: EdgeInsets.only(right: 25),
                                child: Text("7:00AM-800:AM",
                                style: TextStyle(
                                  fontSize:12
                                ),
                               ),
                              ),
                              const SizedBox(height: 4),
                              Container(
                                height: 40,
                                width: 130,
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 222, 209, 171),
                                  border: Border(
                                    top: BorderSide(
                                      color: Colors.black
                                    ),
                                   ),
                                  ),
                                 child: const Padding(
                                   padding:  EdgeInsets.only(left: 90, top: 10),
                                   child:  Text("15",
                                   style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.red
                                   ),),
                                 ),
                              )
                                
                           
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(width: 5),
                    Column(
                      children: [
                        Container(
                          height: 185,
                          width: 130,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            )
                          ),
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 50, top: 6),
                                child: Text("Current",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),),
                              ),
                              const SizedBox(height: 4),

                              const Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Text("6:00AM- 7:00AM",
                                style: TextStyle(
                                  fontSize: 12
                                ),),
                              ),

                              const SizedBox(height: 99),

                            Container(
                              height: 40,
                              width: 130,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 222, 209, 171),
                                border: Border(
                                  top: BorderSide(
                                    color: Colors.black
                                  )
                                )
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: const [
                                  Text("8", style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.green
                                  ),),
                                  Text("12", style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.red
                                  ),)
                                ],
                              ),
                            )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 8),
                Container(
                height:350,
                width: 350,
                decoration:  BoxDecoration(
                  
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const[
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4,
                      spreadRadius: 1,
                      offset: Offset(2,2)
                    )
                  ],
                  color: Colors.white
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      
                        PieChart(
              dataMap: dataMap,
              colorList: colorList,
              chartRadius: MediaQuery.of(context).size.width / 3,
              legendOptions:const LegendOptions(
              showLegends:true,
              ),
              ),
      
              const Divider(
                thickness: 1.5,
                color: Colors.grey,
              ),
      
              PieChart(
              dataMap: dataMap,
              colorList: colorList,
              chartRadius: MediaQuery.of(context).size.width / 3,
              legendOptions:const LegendOptions(
              showLegends:true
              ),
              ),
      
                  ],
                ),
              ),
      
             
             
              
              // Container(
              //   height: 150,
              //   width: MediaQuery.of(context).size.width,
              //   color: Colors.grey,
              //   child: Row(
              //      children: [
              //      PieChart(
              //       dataMap: dataMap,
              //       colorList: colorList,
              //       chartRadius: MediaQuery.of(context).size.width / 4,
              //       legendOptions:const LegendOptions(
              //         showLegends:false
              //       ),
              //       ),
                  
              //       PieChart(
              //         dataMap: dataMap,
              //         colorList: colorList,
              //         chartRadius: MediaQuery.of(context).size.width / 4,
              //         legendOptions: const LegendOptions(
              //           showLegends: false
              //         ),
              //         )
              //     ],
              //   ),
              // ),
             
            ],
          ),
        ),
      ),
    );
  }
}