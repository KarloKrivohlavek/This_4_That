import 'package:flutter/material.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/constants/text_styles.dart';

class OutlinedColorButtonWidget extends StatelessWidget {
  OutlinedColorButtonWidget(
      {required this.buttonHeight,
      required this.buttonText,
      required this.buttonWidth,
      required this.isOn});
  double buttonWidth;
  double buttonHeight;
  String buttonText;
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(16),
      width: buttonWidth,
      height: buttonHeight,
      decoration: BoxDecoration(
          color: isOn == true ? MyColors.orange : Colors.transparent,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: MyColors.orange, width: 2)),
      child: Center(
          child: Padding(
              padding: EdgeInsets.only(top: 6, bottom: 6),
              child: Text(
                buttonText,
                style: MyTextStyles.poppins16w400,
              ))),
    );
  }
}
