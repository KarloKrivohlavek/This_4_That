import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

    isLoggedIn = storageService.getBool(key: 'isLoggedIn');
    // storageService.insertValue(key: 'isLoggedIn', value: false);
    // final googleSignIn = GoogleSignIn();
    // await googleSignIn.disconnect();
    if (isLoggedIn) {
      doesUserDataExist =
          await FirebaseService.instance.doesUserDataHaveAName();
      if (doesUserDataExist) {
        Future.delayed(Duration(seconds: 2))
            .then((value) => Get.offAllNamed(MyRoutes.mainPageScreen));
      } else {
        Future.delayed(Duration(seconds: 2)).then((value) =>
            Get.offAllNamed(MyRoutes.authentificationScreenNameSurname));
      }
    } else {
      Future.delayed(Duration(seconds: 2))
          .then((value) => Get.offAllNamed(MyRoutes.authentificationScreen));
    }
  }

  ///
  /// METHODS
  ///
}
