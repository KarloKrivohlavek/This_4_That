
import 'package:get/get.dart';
import 'package:this_4_that/services/firebase_service.dart';

class EditProfilePageController extends GetxController {
  /// DEPENDENCIES
  final firebaseService = Get.find<FirebaseService>();

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
