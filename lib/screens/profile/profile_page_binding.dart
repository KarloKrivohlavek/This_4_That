import 'package:get/get.dart';

import 'profile_page_controller.dart';

///
/// Because we linked this binding with a screen in `pages.dart`,
/// this binding will get triggered once [HelloScreen] is shown on screen
/// It will initialize [HelloController] and dispose it once the screen is dismissed
///

class ProfilePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(ProfilePageController.new);
  }
}
