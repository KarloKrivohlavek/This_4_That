import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:this_4_that/services/firebase_service.dart';
import 'package:this_4_that/services/logger_service.dart';

class TradeConfirmationController extends GetxController {
  /// DEPENDENCIES

  ///REACTIVE VARIABLES

  final firebaseService = Get.find<FirebaseService>();
  final logger = Get.find<LoggerService>();
  final messageController = TextEditingController();

  /// INIT

  ///
  /// METHODS
}
