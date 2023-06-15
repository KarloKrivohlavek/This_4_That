import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:this_4_that/services/firebase_service.dart';
import 'package:this_4_that/services/logger_service.dart';

class ChatPageController extends GetxController {
  /// DEPENDENCIES

  ///REACTIVE VARIABLES

  final firebaseService = Get.find<FirebaseService>();
  final logger = Get.find<LoggerService>();

  /// INIT

  String chatID = '';
  @override
  Future<void> onInit() async {
    super.onInit();
    chatID = Get.arguments;
  }

  ///
  /// METHODS
  ///
}
