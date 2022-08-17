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
      bottomNavigationBar: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        color: Colors.orange,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: (() {
              
            }), child: const Text("In")),

            ElevatedButton(onPressed: (() {
              // Navigator.push(context, MaterialPageRoute (builder: (context) => const DownPage(),));
            }), 
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder()
            ),
            child: const Text("Ok")),

            ElevatedButton(onPressed: (() {
              
            }), 
            style: ElevatedButton.styleFrom(
              primary: Colors.green
            ),
            child: const Text("In")),

            ElevatedButton(onPressed: (() {
              
            }),
            style: ElevatedButton.styleFrom(
              primary: const Color.fromARGB(255, 112, 89, 18)
            ),
             child: const Text("Out"))
          ],
        ),
      ),

      appBar: AppBar(
        title: const Text("Dashboard"),
        centerTitle: true,
      ),
      body:Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                height: 100,
                width: 380,
                 decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                   color: const Color.fromARGB(255, 214, 187, 187),
                ),
                child:  Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70,vertical: 30),
                    child: SizedBox(
                      height: 70,
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

                  const Padding(
                    padding:EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                    child:Text("Last Out",
                    style: TextStyle(
                      fontSize: 18
                    ),),
                  )
                ],
              ),
              ),
            ),
            const SizedBox(height: 10),

            Container(
              height: 240,
              width: 380,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 214, 187, 187),
             ),

             child: Column(
              children:  [
               const Padding(
                 padding: EdgeInsets.only(right: 145, top: 6),
                 child: Text("Month & Date",
                  style: TextStyle(
                    fontSize: 18,
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
                        padding: EdgeInsets.only(right: 130),
                        child: Text("Total Activity Time",
                        style: TextStyle(
                          fontSize: 18
                        ),),
                      ),
                 ],
             ),
            ),
                  const SizedBox(height: 10),
                       Container(
                        height: 120,
                        width: 380,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 214, 187, 187),
                        ),

                        child: const Text("Fees Detail",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18
                        ),),
                      )
           ],
           ),
      )
      
    );
  }
}