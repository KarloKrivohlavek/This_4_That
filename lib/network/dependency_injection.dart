import 'package:get/get.dart';

import 'package:this_4_that/network/network_controller.dart';

class DependencyInjection {
  static void init() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}
