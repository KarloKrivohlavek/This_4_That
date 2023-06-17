import 'package:flutter/material.dart';
import 'package:this_4_that/constants/colors.dart';

class MyThemes {
  static const primary = MyColors.orange;
  static const primaryColor = MyColors.orange;

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColorDark: primaryColor,
    hintColor: MyColors.orange,
    colorScheme: const ColorScheme.dark(primary: primary),
    dividerColor: Colors.white,
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: primaryColor,
    colorScheme: const ColorScheme.light(primary: primary),
    dividerColor: Colors.black,
  );
}
