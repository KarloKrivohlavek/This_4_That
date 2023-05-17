import 'package:get/get.dart';

import '../add_item/add_item_page_controller.dart';
import '../home/home_page_controller.dart';
import '../messages/messages_page_controller.dart';
import '../profile/profile_page_controller.dart';
import 'main_page_controller.dart';

///
/// Because we linked this binding with a screen in `pages.dart`,
/// this binding will get triggered once [HelloScreen] is shown on screen
/// It will initialize [HelloController] and dispose it once the screen is dismissed
///

class MainPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(MainPageController.new);
    Get.lazyPut(HomePageController.new);
    Get.lazyPut(AddItemPageController.new);
    Get.lazyPut(MessagesPageController.new);
    Get.lazyPut(ProfilePageController.new);
  }
}
