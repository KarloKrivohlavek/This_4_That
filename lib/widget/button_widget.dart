import 'package:flutter/material.dart';
import 'package:this_4_that/constants/colors.dart';

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
            shape: const StadiumBorder(),
            foregroundColor: color,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            backgroundColor: MyColors.orange),
        onPressed: onClicked,
        child: Text(text),
      );
}
