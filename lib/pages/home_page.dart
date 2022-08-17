import 'package:flutter/material.dart';
import 'package:sport/pages/home_page1.dart';
import 'package:sport/pages/in_page.dart';
import 'package:sport/pages/out_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pagesIndex = 0;
  final pages = [
  const HomePage1(),
    const InPage(),
  const OutPage()];
  
  final String _home = 'Home';
  final String _in = 'In';
  final String _out = 'Out';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: pagesIndex,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.home_filled), label: _home),
            BottomNavigationBarItem(
                icon: const Icon(Icons.arrow_downward), label: _in),
            BottomNavigationBarItem(
                icon: const Icon(Icons.arrow_upward), label: _out)
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
