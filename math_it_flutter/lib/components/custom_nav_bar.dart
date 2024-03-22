// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, must_be_immutable, unused_field

import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  void Function(int)? onTap;
  int currentIndex = 0;
  BottomNavBar({super.key, required this.onTap, required this.currentIndex});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: BottomNavigationBar(
          selectedItemColor: const Color.fromARGB(211, 255, 255, 255),
          unselectedItemColor: Color.fromARGB(255, 109, 19, 19),
          backgroundColor: Colors.red[400],
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_alt),
              label: 'About Us',
            ),
          ],
          onTap: widget.onTap,
          currentIndex: widget.currentIndex,
        ),
      ),
    );
  }
}
