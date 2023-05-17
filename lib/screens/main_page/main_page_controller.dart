import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';



class MainPageController extends GetxController {


  /// DEPENDENCIES

  ///REACTIVE VARIABLES

  final RxInt _currentIndex = 0.obs;

  int get currentIndex => _currentIndex.value;

  set currentIndex(int value) => _currentIndex.value = value;

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
