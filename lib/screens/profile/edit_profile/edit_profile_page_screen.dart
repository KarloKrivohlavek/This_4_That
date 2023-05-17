import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:this_4_that/screens/profile/profile_page_controller.dart';

import 'edit_profile_page_controller.dart';

///
/// This is a screen in which we write widgets concerning [HelloScreen]
///

class EditProfilePageScreen extends GetView<EditProfilePageController> {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('appName'.tr),
      ),
      body: Center());
}
