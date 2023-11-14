import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:this_4_that/authentification_screens/authentification_screen_3_username.dart';
import 'package:this_4_that/authentification_screens/authentification_screen_4_date_of_birth.dart';
import 'package:this_4_that/authentification_screens/authentification_screen_5_description.dart';
import 'package:this_4_that/authentification_screens/authentification_screen_6_location.dart';
import 'package:this_4_that/models/user/user.dart';
import 'package:this_4_that/services/firebase_service.dart';
import 'package:this_4_that/services/logger_service.dart';

class AuthentificationController extends GetxController {
  /// DEPENDENCIES

  ///REACTIVE VARIABLES
  final logger = Get.find<LoggerService>();
  final firebaseService = Get.find<FirebaseService>();

  final Rx<UserData> _currentUserData = UserData(
          dateOfBirth: '',
          description: '',
          fullName: '',
          location: '',
          userID: '',
          username: '',
          email: '')
      .obs;
  UserData get currentUserData => _currentUserData.value;
  set currentUserData(UserData value) => _currentUserData.value = value;

  final firstAndLastNameController = TextEditingController();
  final RxBool _firstAndLastNameIsEmpty = false.obs;
  bool get firstAndLastNameIsEmpty => _firstAndLastNameIsEmpty.value;
  set firstAndLastNameIsEmpty(bool value) =>
      _firstAndLastNameIsEmpty.value = value;

  final usernameController = TextEditingController();
  final RxBool _usernameIsEmpty = false.obs;
  bool get usernameIsEmpty => _usernameIsEmpty.value;
  set usernameIsEmpty(bool value) => _usernameIsEmpty.value = value;

  String selectedDay = '';
  String selectedMonth = '';
  String selectedYear = '';
  final RxBool _dateIsEmpty = false.obs;
  bool get dateIsEmpty => _dateIsEmpty.value;
  set dateIsEmpty(bool value) => _dateIsEmpty.value = value;

  final descriptionController = TextEditingController();
  final RxBool _descriptionIsEmpty = false.obs;
  bool get descriptionIsEmpty => _descriptionIsEmpty.value;
  set descriptionIsEmpty(bool value) => _descriptionIsEmpty.value = value;

  /// INIT

  @override
  Future<void> onInit() async {
    super.onInit();
    addListeners();
  }

  ///
  /// METHODS
  ///

  Future<void> googleSignIn() async {
    await firebaseService.signInWithGoogle();

// firebaseService je neka varijabla koju inicijaliziraš prije u varijablama kao final firebaseService = Get.find<FirebaseService();

    // todo: napisati što nakon što se user prijavi, gdje ga treba preusmjeriti dalje, ima li još nešto što se treba napraviti nakon prijave itd.
  }

  void addListeners() {
    //ovaj listener sluzi za saveanje imena i prezimena
    firstAndLastNameController.addListener(() {
      firstAndLastNameIsEmpty = firstAndLastNameController.text.isNotEmpty &&
          firstAndLastNameController.text.length > 3;
    });
    //ovaj listener sluzi za dodavanje usernamea
    usernameController.addListener(() {
      usernameIsEmpty = usernameController.text.isNotEmpty &&
          usernameController.text.length > 3;
    });
    //ovaj listener sluzi za dodavanje opisa
    descriptionController.addListener(() {
      descriptionIsEmpty = descriptionController.text.isNotEmpty &&
          descriptionController.text.length > 10;
    });
  }

  void saveFirstNameAndLastName() {
    // logger.w(firstAndLastNameController.text);
    currentUserData =
        currentUserData.copyWith(fullName: firstAndLastNameController.text);
    // logger.e(currentUserData);
    Get.to(() => const AuthentificationScreen3Username());
  }

  void saveUsername() {
    // logger.w(usernameController.text);
    currentUserData =
        currentUserData.copyWith(username: usernameController.text);
    logger.e(currentUserData);
    Get.to(() => const AuthentificationScreen4DateOfBirth());
  }

  void saveDateOfBirth() {
    logger.wtf(selectedYear);
    logger.wtf(selectedDay);
    logger.wtf(selectedMonth);

    String finalDate = '$selectedMonth/$selectedDay/$selectedYear';
    currentUserData = currentUserData.copyWith(dateOfBirth: finalDate);
    Get.to(() => const AuthentificationScreen5Description());
  }

  bool checkIfDatePicked() {
    dateIsEmpty = selectedYear.isNotEmpty &&
        selectedMonth.isNotEmpty &&
        selectedDay.isNotEmpty;
    return dateIsEmpty;
  }

  void saveDescription() {
    logger.w(descriptionController.text);
    currentUserData =
        currentUserData.copyWith(description: descriptionController.text);
    logger.e(currentUserData);
    Get.to(() => const AuthentificationScreen6Location());
  }

  void saveLocation({String location = 'Zagreb'}) {
    // logger.w(descriptionController.text);
    currentUserData = currentUserData.copyWith(
        location: location,
        userID: FirebaseAuth.instance.currentUser!.uid,
        email: FirebaseAuth.instance.currentUser!.email!);
    // logger.e(currentUserData);
    // Get.to(() => AuthentificationScreen6Location());
  }

  void saveUserDataToFirebase() {
    firebaseService.sendNewUserData(currentUserData);
  }
}
