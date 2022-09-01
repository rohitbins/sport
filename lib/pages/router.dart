import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport/pages/home_page1.dart';
import 'package:sport/pages/in_page.dart';
import 'package:sport/pages/out_page.dart';
import 'package:sport/pages/pnp_page.dart';

class MyRoute extends StatefulWidget {
  const MyRoute({Key? key}) : super(key: key);

  @override
  State<MyRoute> createState() => _MyRouteState();
}

class _MyRouteState extends State<MyRoute> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  int pagesIndex = 0;
  final pages = [const HomePage1(), const InPage(), const OutPage(),const PnpPage()];

  final String _home = 'Home';
  final String _in = 'In';
  final String _out = 'Out';
  final String _pnp = 'Pnp';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: pagesIndex,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.home_filled,color: Colors.grey,), label: _home),
            BottomNavigationBarItem(
                icon: const Icon(Icons.arrow_downward, color: Colors.grey,), label: _in),
            BottomNavigationBarItem(
                icon: const Icon(Icons.arrow_upward, color: Colors.grey,), label: _out),
            BottomNavigationBarItem(
                icon: const Icon(Icons.spatial_audio_off,color: Colors.grey,),label: _pnp)    
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
