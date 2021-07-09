import 'package:flutter/material.dart';


import 'screens/about.dart';
import 'screens/home.dart';
import 'screens/tips_screen.dart';



//////this page controls the bottom navigation in the app. the code below shows how it is executed...
///it has 3 tabs. it starts at the HomeScreen class and can be navigated to Tips and About screens

class BottomNav extends StatefulWidget {
  @override
  _BottomNav createState() => _BottomNav();
}

class _BottomNav extends State<BottomNav> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    Tips(),
    About()
  ];
  



  void onTabTapped (int index){
    setState(() {
          _currentIndex = index;
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      // Theme.of(context).accentColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Plant Identification',
          style: TextStyle(
            fontFamily: 'Futura',
            color: Theme.of(context).accentColor,
            fontWeight: FontWeight.w500,
            fontSize: 27,
          ),
        ),
      ),
    

      body: _children[_currentIndex], 
      bottomNavigationBar: BottomNavigationBar(onTap: onTabTapped,
      currentIndex: _currentIndex,
      iconSize: 28,
      selectedFontSize: 15,
      selectedItemColor: Theme.of(context).accentColor,
      unselectedItemColor: Colors.black54,
      type: BottomNavigationBarType.fixed,
      
      items: [
          BottomNavigationBarItem(icon: Icon(Icons.house),
          label: 'Home'),
           BottomNavigationBarItem(icon: Icon(Icons.info),
          label: 'Tips'),
           BottomNavigationBarItem(icon: Icon(Icons.contact_support_rounded),
          label: 'About'),
        ],
      
      )
      // bottomNavigationBar: ,
    );

  }
}
