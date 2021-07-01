import 'package:flutter/material.dart';
import 'package:ventor/screens/events_screen.dart';
import 'package:ventor/screens/profile_screen.dart';

class MainScaffold extends StatefulWidget {
  @override
  _MainScaffoldState createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _currentIndex = 0;

  final List _screens = [
    EventsScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color.fromRGBO(255, 136, 209, 1),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(_currentIndex == 0 ? Icons.home : Icons.home_outlined),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                  _currentIndex == 1 ? Icons.person : Icons.person_outlined),
              label: 'Profile'),
        ],
        currentIndex: _currentIndex,
        onTap: (currentIndex) => setState(
          () => _currentIndex = currentIndex,
        ),
      ),
    );
  }
}
