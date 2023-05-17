import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:this_4_that/screens/profile/profile_page_controller.dart';


///
/// This is a screen in which we write widgets concerning [HelloScreen]
///

class ProfilePageScreen extends GetView<ProfilePageController> {
  @override
  Widget build(BuildContext context) => Scaffold(
  appBar: AppBar(
  title: Text('appName'.tr),
  ),
  body: Center(
  ));
}
