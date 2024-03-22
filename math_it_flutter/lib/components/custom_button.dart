// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:math_it_flutter/components/custom_dialog.dart';

class BigButton extends StatelessWidget {
  String imagePath;
  String title;
  String content;
  BigButton(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      // button customization
      margin: EdgeInsets.all(18),
      width: MediaQuery.of(context).size.width - 18 * 2,
      height: MediaQuery.of(context).size.height / 4,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 6,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),

          // show big dialog on pressed
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return BigCustomDialog(
                    title: title,
                    imagePath: imagePath,
                    content: content,
                  );
                });
          },

          // image in button
          child: Image.asset(
            imagePath,
            width: 520,
          )),
    );
  }
}

class SmallButton extends StatelessWidget {
  String imagePath;
  String buttonTitle;
  String buttonContent;
  SmallButton(
      {super.key,
      required this.imagePath,
      required this.buttonTitle,
      required this.buttonContent});

  @override
  Widget build(BuildContext context) {
    return Container(
      // button customization
      width: (MediaQuery.of(context).size.width - 25 * 2) / 2,
      height: MediaQuery.of(context).size.height / 4,
      margin: EdgeInsets.fromLTRB(18, 0, 0, 9),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 6,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18))),

        // show small dialog on pressed
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return SmallCustomDialog(
                  title: buttonTitle,
                  imagePath: "lib/images/small_graph.png",
                  content: buttonContent,
                );
              });
        },

        // image in button
        child: Image.asset(
          imagePath,
        ),
      ),
    );
  }
}
