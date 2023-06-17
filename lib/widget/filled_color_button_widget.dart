import 'package:flutter/material.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/constants/text_styles.dart';

class FilledColorButtonWidget extends StatelessWidget {
  FilledColorButtonWidget({super.key, 
    required this.buttonHeight,
    required this.buttonText,
    required this.buttonWidth,
    required this.isEnabled,
  });
  double buttonWidth;
  double buttonHeight;
  String buttonText;
  bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(16),
      width: buttonWidth,
      height: buttonHeight,
      decoration: BoxDecoration(
          color: isEnabled == true ? MyColors.orange : MyColors.grey,
          borderRadius: BorderRadius.circular(50)),
      child: Center(
          child: Padding(
              padding: const EdgeInsets.only(top: 6, bottom: 6),
              child: Text(
                buttonText,
                style: MyTextStyles.poppins16w400,
              ))),
    );
  }
}
