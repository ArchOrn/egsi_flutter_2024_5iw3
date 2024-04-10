import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_5iw3/calendar_screen.dart';
import 'package:flutter_5iw3/favorites_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _screens = [
    ScreenDef(
      icon: Icons.favorite,
      label: 'Favorites',
      widget: const FavoritesScreen(),
    ),
    ScreenDef(
      icon: Icons.calendar_today,
      label: 'Today',
      widget: const CalendarScreen(),
    ),
    ScreenDef(
      icon: Icons.verified_user_sharp,
      label: 'Toto',
      widget: Container(
        color: Colors.purple,
      ),
    ),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 1,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.airplanemode_on,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'My Title',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: _screens[_currentIndex].widget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: _screens.map((e) {
          return BottomNavigationBarItem(
            label: e.label,
            icon: Icon(e.icon),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        shape: const CircleBorder(),
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class ScreenDef {
  final IconData icon;
  final String label;
  final Widget widget;

  ScreenDef({required this.icon, required this.label, required this.widget});
}
