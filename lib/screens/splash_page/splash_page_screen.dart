import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/screens/splash_page/splash_page_controller.dart';

///
/// This is a screen in which we write widgets concerning [HelloScreen]
///

class SplashPageScreen extends GetView<SplashPageController> {
  SplashPageScreen({super.key});
  @override
  final controller = Get.put(SplashPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: MyColors.orange,
        child: Center(
          child: SizedBox(height: 100.h, child: Image.asset('images/logo.png')),
        ),
      ),
    );
  }
}
