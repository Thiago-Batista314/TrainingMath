// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  const ToDoTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        padding: EdgeInsets.fromLTRB(12, 20, 12, 20),
        child: Row(
          children: [
            Icon(Icons.check_box_outline_blank, size: 30,),

            Text("\tO'Bryan",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }
}