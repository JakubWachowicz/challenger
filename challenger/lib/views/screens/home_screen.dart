import 'package:challenger/constants.dart';
import 'package:flutter/material.dart';

import '../widgets/slot_machine.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        child: pages[pageIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: pageIndex,
        selectedItemColor: buttonColor,
        unselectedItemColor: textColor,
        backgroundColor: backGroundColor,
        onTap: (index){
          setState(() {
            pageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search),label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.generating_tokens),label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: 'home'),

        ],

      ),
    );
  }
}
