import 'package:get/get.dart';

class MessagesPageController extends GetxController {
  /// DEPENDENCIES

  ///REACTIVE VARIABLES
  final List messages = [
    'message 1',
    'message 2',
    'message 3',
  ];

  bool isActiveButton1On = false;
  bool isActiveButton2On = false;
  bool isActiveButton3On = false;

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
