// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, sized_box_for_whitespace
import 'package:flutter/material.dart';

class BigCustomDialog extends StatefulWidget {
  String title;
  String imagePath;
  String content;
  BigCustomDialog(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.content});

  @override
  State<BigCustomDialog> createState() => _BigCustomDialogState();
}

class _BigCustomDialogState extends State<BigCustomDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color.fromARGB(20, 255, 255, 255),
        ),
        height: MediaQuery.of(context).size.height * 2,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            // title
            Container(
              decoration: BoxDecoration(
                  color: Colors.red[400],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),

            // main image (chart)
            Image.asset(widget.imagePath),

            // content
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                widget.content,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SmallCustomDialog extends StatefulWidget {
  String title;
  String imagePath;
  String content;
  SmallCustomDialog(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.content});

  @override
  State<SmallCustomDialog> createState() => _SmallCustomDialogState();
}

class _SmallCustomDialogState extends State<SmallCustomDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Color.fromARGB(237, 255, 255, 255),
        title: Container(
            decoration: BoxDecoration(
                color: Colors.red[400], borderRadius: BorderRadius.circular(6)),
            child: Center(
                child: Text(
              widget.title,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ))),

        // content inside dialog box
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        content: Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      widget.imagePath,
                      width: 150,
                      height: 200,
                    ),
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width / 3,
                      ),
                      child: Text(
                        widget.content,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 10,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )));
  }
}
