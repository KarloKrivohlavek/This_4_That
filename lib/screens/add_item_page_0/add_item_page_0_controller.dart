import 'package:get/get.dart';
import 'package:this_4_that/services/firebase_service.dart';


class AddItemPage0Controller extends GetxController {
  /// DEPENDENCIES
  final firebaseService = Get.find<FirebaseService>();

  ///REACTIVE VARIABLES
  final RxString _userNickname = 'korisnik'.obs;
  String get userNickname => _userNickname.value;
  set userNickname(String value) => _userNickname.value = value;

  // final logger = Get.find<LoggerService>();

  /// INIT

  @override
  Future<void> onInit() async {
    super.onInit();
    final userData = await firebaseService.getCurrentUserData();
    userNickname = userData.username;
  }

  ///
  /// METHODS
}
