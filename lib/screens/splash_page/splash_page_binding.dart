import 'package:get/get.dart';
import 'package:this_4_that/screens/splash_page/splash_page_controller.dart';

///
/// Because we linked this binding with a screen in `pages.dart`,
/// this binding will get triggered once [HelloScreen] is shown on screen
/// It will initialize [HelloController] and dispose it once the screen is dismissed
///

class SplashPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(SplashPageController.new);
  }
}
