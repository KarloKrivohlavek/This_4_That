import 'package:get/get.dart';
import 'package:this_4_that/pages.dart';
import 'package:this_4_that/services/firebase_service.dart';
import 'package:this_4_that/services/logger_service.dart';
import 'package:this_4_that/services/storage_service.dart';

class SplashPageController extends GetxController {
  /// DEPENDENCIES

  ///REACTIVE VARIABLES
  final logger = Get.find<LoggerService>();

  final storageService = Get.find<StorageService>();

  bool isLoggedIn = false;

  bool doesUserDataExist = false;

  /// INIT

  @override
  Future<void> onInit() async {
    super.onInit();
    //
    // isLoggedIn = storageService.getBool(key: 'isLoggedIn');
    //
    // if (isLoggedIn) {
    //   doesUserDataExist =
    //       await FirebaseService.instance.doesUserDataHaveAName();
    //   if (doesUserDataExist) {
    //     Future.delayed(Duration(seconds: 2));
    //     Get.offAllNamed(MyRoutes.mainPageScreen);
    //   } else {
    //     Future.delayed(Duration(seconds: 2));
    //     Get.offAllNamed(MyRoutes.authentificationScreenNameSurname);
    //   }
    // } else {
    //   Future.delayed(Duration(seconds: 2));
    //   Get.offAllNamed(MyRoutes.authentificationScreen);
    // }
  }

  ///
  /// METHODS
  ///
}
