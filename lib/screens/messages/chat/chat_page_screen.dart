import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'chat_page_controller.dart';

///
/// This is a screen in which we write widgets concerning [HelloScreen]
///

class ChatPageScreen extends GetView<ChatPageController> {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('appName'.tr),
      ),
      body: Center());
}
