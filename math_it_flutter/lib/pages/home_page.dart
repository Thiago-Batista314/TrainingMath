// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:math_it_flutter/components/custom_button.dart';
import 'package:math_it_flutter/pages/exercises_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 219, 219),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // all time button with graph
              BigButton(
                imagePath: "lib/images/big_graph.png",
                title: "Something",
                content: "More Something so much and intense times",
              ),

              Row(
                children: [
                  // last three days button with graph
                  SmallButton(
                    imagePath: "lib/images/small_graph.png",
                    buttonTitle: "Something",
                    buttonContent: "More Something so much and intense times",
                  ),

                  // today button with graph
                  SmallButton(
                    imagePath: "lib/images/small_graph.png",
                    buttonTitle: "Something",
                    buttonContent: "More Something so much and intense times",
                  )
                ],
              )
            ],
          ),

          // Start Math Button
          Container(
            width: MediaQuery.of(context).size.width / 1.5,
            margin: EdgeInsets.only(bottom: 5),
            child: FloatingActionButton(
                elevation: 6,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                backgroundColor: Colors.red[400],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Start Math Exercise",
                      style: TextStyle(
                          color: const Color.fromARGB(225, 255, 255, 255),
                          fontSize: 20),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.play_circle_outlined,
                      size: 30,
                      color: const Color.fromARGB(225, 255, 255, 255),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ExercisesPage()));
                }),
          ),
        ],
      ),
    );
  }
}
