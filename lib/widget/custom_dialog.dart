import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/constants/text_styles.dart';
import 'package:this_4_that/themes.dart';

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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: MyColors.black,
      contentTextStyle: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      title: Text(title),
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      content: Text(text),
      actions: <Widget>[
        TextButton(
          onPressed: () => action,
          child: Text(
            button1,
            style: GoogleFonts.poppins(
              color: MyColors.orange,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, button1),
          child: Text(
            button2,
            style: GoogleFonts.poppins(
              color: MyColors.orange,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
