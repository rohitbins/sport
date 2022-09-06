import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport/pages/home_page1.dart';
import 'package:sport/pages/in_page.dart';
import 'package:sport/pages/out_page.dart';
import 'package:sport/pages/pnp_page.dart';
import 'package:sport/utils/constants.dart';

class MyRoute extends StatefulWidget {
  const MyRoute({Key? key, }) : super(key: key);
  

  @override
  State<MyRoute> createState() => _MyRouteState();
}

class _MyRouteState extends State<MyRoute> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool showFees = false;
  
  
  void initState(){
    super.initState();
    _prefs.then((value){
      showFees = value.getBool(("fees"))!;
    });
  }
  int pagesIndex = 0;
  final pages = [const HomePage1(), const InPage(), const OutPage(), const PnpPage()];

  final String _home = 'Home';
  final String _in = 'In';
  final String _out = 'Out';
  final String _PNP = 'PNP';
  @override
  Widget build(BuildContext context) {
    return ShowFee?const HomePage1():DefaultTabController(
      
      length: 4,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: pagesIndex,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.home_filled,color: Colors.grey,), label: _home),
                // if(ShowFee)
            BottomNavigationBarItem(
                icon: const Icon(Icons.arrow_downward, color: Colors.grey,), label: _in),
                // if(ShowFee)
            BottomNavigationBarItem(
                icon: const Icon(Icons.arrow_upward, color: Colors.grey,), label: _out),
                // if(ShowFee)
            BottomNavigationBarItem(
                icon: const Icon(Icons.spatial_audio_off,color: Colors.grey,),label: _PNP)    
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
