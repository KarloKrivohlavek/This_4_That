import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/pages.dart';
import 'package:this_4_that/screens/splash_page/splash_page_controller.dart';
import 'package:this_4_that/services/firebase_service.dart';
import 'package:this_4_that/services/logger_service.dart';
import 'package:this_4_that/services/storage_service.dart';

///
/// This is a screen in which we write widgets concerning [HelloScreen]
///

// class SplashPageScreen extends GetView<SplashPageController> {
//   const SplashPageScreen({super.key});

class SplashPageScreen extends StatefulWidget {
  const SplashPageScreen({Key? key}) : super(key: key);

  @override
  State<SplashPageScreen> createState() => _SplashPageScreenState();
}

class _SplashPageScreenState extends State<SplashPageScreen> {
  final logger = Get.find<LoggerService>();

  final storageService = Get.find<StorageService>();

  bool isLoggedIn = false;

  bool doesUserDataExist = false;

  @override
  void initState() {
    super.initState();
    checkIfUserLoggedIn();
  }

  Future<void> checkIfUserLoggedIn() async {
    isLoggedIn = storageService.getBool(key: 'isLoggedIn');

    if (isLoggedIn) {
      doesUserDataExist =
          await FirebaseService.instance.doesUserDataHaveAName();
      if (doesUserDataExist) {
        Future.delayed(Duration(seconds: 2));
        Get.offAllNamed(MyRoutes.mainPageScreen);
      } else {
        Future.delayed(Duration(seconds: 2));
        Get.offAllNamed(MyRoutes.authentificationScreenNameSurname);
      }
    } else {
      Future.delayed(Duration(seconds: 2));
      Get.offAllNamed(MyRoutes.authentificationScreen);
    }
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Text(
                isLoggedIn.toString(),
                style: TextStyle(color: MyColors.orange),
              ),
              Container(
                color: MyColors.orange,
                child: Center(
                    child: SizedBox(
                  height: 200,
                  child: Image.asset('images/logo.png'),
                )),
              ),
            ],
          ),
        ),
      );
}
