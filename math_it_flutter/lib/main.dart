// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:math_it_flutter/pages/navigation_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NavigationPage(),
    );
  }
}
