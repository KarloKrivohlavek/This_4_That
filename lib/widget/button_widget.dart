import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  final Color color;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            foregroundColor: color,
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            backgroundColor: Colors.orange),
        child: Text(text),
        onPressed: onClicked,
      );
}
