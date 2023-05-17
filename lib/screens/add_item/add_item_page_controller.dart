import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AddItemPageController extends GetxController {
  /// DEPENDENCIES

  ///REACTIVE VARIABLES
// reactive variabla

  final RxInt _activeStep = 0.obs;
  int get activeStep => _activeStep.value;
  set activeStep(int value) => _activeStep.value = value;
  // Initial step set to 0.
  final pageController = PageController(
    initialPage: 0,
  );

  // OPTIONAL: can be set directly.
  int dotCount = 5;

  // final logger = Get.find<LoggerService>();

  /// INIT

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  ///
  /// METHODS
  ///
}
