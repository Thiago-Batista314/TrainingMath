// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ExercisesPage extends StatelessWidget {
  const ExercisesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        child: Center(child: Text("go back")),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
