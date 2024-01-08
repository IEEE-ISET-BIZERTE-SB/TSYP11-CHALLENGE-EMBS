// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mobile_front_end/core/screens/home_page.dart';
import 'package:mobile_front_end/features/patients/presentation/pages/Patients_page.dart';

class StarterWidget extends StatefulWidget {
  StarterWidget({super.key});

  @override
  State<StarterWidget> createState() => _StarterWidgetState();
}

class _StarterWidgetState extends State<StarterWidget> {

   int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index; 
    }
    );
  }
  final List _pages = [
    HomePage(),
    PatientsPage(),
    PatientsPage(),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: _pages[_selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _navigateBottomBar,
            items: [
              BottomNavigationBarItem(
                backgroundColor: Colors.blue,
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.sick),
                label: 'Patients'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_box),
                label: 'Profile'
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.settings),
              //   label: 'Settings'
              // ),
            ]
          ),
        );
  }
}