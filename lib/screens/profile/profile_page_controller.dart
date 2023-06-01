import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../models/user/user.dart';

class ProfilePageController extends GetxController {
  /// DEPENDENCIES

  ///REACTIVE VARIABLES
  final RxBool _isActiveButtonOn = true.obs;
  bool get isActiveButtonOn => _isActiveButtonOn.value;
  set isActiveButtonOn(bool value) => _isActiveButtonOn.value = value;

  User thisUser = User(
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
    List<User> allUsers = await getAllUsers();
    thisUser = allUsers[0];
  }

  ///
  /// METHODS

  Future<List<User>> getAllUsers() async {
    final allUsers = await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((value) =>
            value.docs.map((doc) => User.fromJson(doc.data())).toList());
    return allUsers;
  }
}