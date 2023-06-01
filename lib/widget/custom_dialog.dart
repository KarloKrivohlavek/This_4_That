import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  CustomDialog(
      {super.key,
      required this.title,
      required this.text,
      required this.button1,
      required this.button2,
      required this.action});

  String title;
  String text;
  Function() action;
  String button1;
  String button2;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(text),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, button1),
          child: Text(button1),
        ),
        TextButton(
          onPressed: () => action,
          child: Text(button2),
        ),
      ],
    );
  }
}
