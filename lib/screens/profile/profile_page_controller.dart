import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../models/user/user.dart';

class ProfilePageController extends GetxController {
  /// DEPENDENCIES

  ///REACTIVE VARIABLES
  final RxBool _isActiveButtonOn = true.obs;
  bool get isActiveButtonOn => _isActiveButtonOn.value;
  set isActiveButtonOn(bool value) => _isActiveButtonOn.value = value;

  UserData thisUser = UserData(
      dateOfBirth: '',
      description: '',
      fullName: '',
      location: '',
      userID: '',
      username: '');

  // final logger = Get.find<LoggerService>();

  /// INIT

  @override
  Future<void> onInit() async {
    super.onInit();
    List<UserData> allUsers = await getAllUsers();
    thisUser = allUsers[0];
  }

  ///
  /// METHODS

  Future<List<UserData>> getAllUsers() async {
    final allUsers = await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((value) =>
            value.docs.map((doc) => UserData.fromJson(doc.data())).toList());
    return allUsers;
  }
}
