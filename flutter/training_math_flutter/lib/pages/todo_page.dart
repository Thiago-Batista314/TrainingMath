// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../util/todo_tile.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Center(
          child: Text("To Do", 
            style: TextStyle(fontWeight: FontWeight.w900),
            )
        ),
        backgroundColor: Colors.yellow,
        elevation: 0,
      ),
      body: ListView(
        children: [
          ToDoTile(),
        ],
      ),
    );
  }
}