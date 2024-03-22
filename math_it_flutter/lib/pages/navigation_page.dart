// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field,

import 'package:flutter/material.dart';
import 'package:math_it_flutter/components/custom_nav_bar.dart';
import 'package:math_it_flutter/pages/about_us_page.dart';
import 'package:math_it_flutter/pages/home_page.dart';
import 'package:math_it_flutter/pages/settings_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SettingsPage(),
    AboutUsPage(),
  ];

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 219, 219),

      // top bar
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        centerTitle: true,
        title: Text(
          "Math It!",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(255, 255, 255, 255)),
        ),

        // open drawer button
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(
              Icons.menu,
              size: 30,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          );
        }),
      ),

      // drawer itself
      drawer: Drawer(),

      // change page on bottom nav bar
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),

      // bottom navigation bar
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }
}
