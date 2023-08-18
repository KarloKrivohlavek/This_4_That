import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

///
/// This is a class where all text styles are stored
/// You can then reference them in code with `MyTextStyles.someTextStyle`
///

class MyTextStyles {
  static final poppins16w400 = GoogleFonts.poppins(
    color: MyColors.black,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );

  static final poppins16w700 = GoogleFonts.poppins(
    color: MyColors.black,
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
  );

  static final poppins40w700 = GoogleFonts.poppins(
    color: MyColors.black,
    fontSize: 40.sp,
    fontWeight: FontWeight.w700,
  );

  static final poppins24w700 = GoogleFonts.poppins(
    color: MyColors.black,
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
  );
  static final poppins24w400 = GoogleFonts.poppins(
    color: MyColors.black,
    fontSize: 24.sp,
    fontWeight: FontWeight.w400,
  );
}
