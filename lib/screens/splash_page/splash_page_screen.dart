import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:this_4_that/authentification_screens/authentification_screen_1_login.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/constants/strings.dart';
import 'package:this_4_that/constants/text_styles.dart';
import 'package:this_4_that/data.dart';
import 'package:this_4_that/pages.dart';
import 'package:this_4_that/profile_page.dart';
import 'package:this_4_that/screens/profile/profile_page_controller.dart';
import 'package:this_4_that/screens/profile/widgets/profile_page_edit_profile_preview_widget.dart';
import 'package:this_4_that/screens/profile/widgets/user_profile_item_preview.dart';
import 'package:this_4_that/screens/splash_page/splash_page_controller.dart';
import 'package:this_4_that/services/firebase_service.dart';
import 'package:this_4_that/src/edit_profile_page.dart';
import 'package:this_4_that/user.dart';
import 'package:this_4_that/user_preferences.dart';
import 'package:this_4_that/widget/custom_dialog.dart';
import 'package:this_4_that/widget/profile_widget.dart';

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
