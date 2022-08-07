import 'package:flutter/material.dart';
import 'package:sport/pages/home_page1.dart';
import 'package:sport/pages/in_page.dart';
import 'package:sport/pages/out_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

int pagesIndex = 2;

final pages = [
  const HomePage1(),
  const InPage(),
  const OutPage()
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
       bottomNavigationBar: BottomNavigationBar(
         currentIndex: pagesIndex,
         items:const [
           BottomNavigationBarItem(
             icon: Icon(Icons.home_filled),
             label: 'Home'),

           BottomNavigationBarItem(
             icon: Icon(Icons.arrow_downward),
             label: 'In'),

           BottomNavigationBarItem(
             icon: Icon(Icons.arrow_upward),
             label: 'Out' )    
         ],
         onTap: (index) {
           setState(() {
             pagesIndex = index;
           });
         },
         ),
       body: pages[pagesIndex],
      ),
    );
  }
}