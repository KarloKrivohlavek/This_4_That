import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:this_4_that/authentification_screens/authentification_screen_1_login.dart';
import 'package:this_4_that/services/firebase_service.dart';
import 'package:this_4_that/services/logger_service.dart';

import '../../models/item/item.dart';
import '../../models/user/user.dart';
import '../../pages.dart';

class ProfilePageController extends GetxController {
  /// DEPENDENCIES
  ///
  final logger = Get.find<LoggerService>();

  final firebaseService = Get.find<FirebaseService>();

  ///REACTIVE VARIABLES
  final RxBool _isActiveButtonOn = true.obs;
  bool get isActiveButtonOn => _isActiveButtonOn.value;
  set isActiveButtonOn(bool value) => _isActiveButtonOn.value = value;

  final userNameController = TextEditingController();
  final RxBool _userNameIsEmpty = true.obs;
  bool get userNameIsEmpty => _userNameIsEmpty.value;
  set userNameIsEmpty(bool value) => _userNameIsEmpty.value = value;

  final descriptionController = TextEditingController();
  final RxBool _descriptionIsEmpty = true.obs;
  bool get descriptionIsEmpty => _descriptionIsEmpty.value;
  set descriptionIsEmpty(bool value) => _descriptionIsEmpty.value = value;

  List<Item> allItems = [];

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

  final RxList<Item> _currentUserItems = <Item>[].obs;
  List<Item> get currentUserItems => _currentUserItems;
  set currentUserItems(List<Item> value) => _currentUserItems.assignAll(value);

  final RxList<Item> _currentUserItemsActive = <Item>[].obs;
  List<Item> get currentUserItemsActive => _currentUserItemsActive;
  set currentUserItemsActive(List<Item> value) =>
      _currentUserItemsActive.assignAll(value);

  final RxList<Item> _currentUserItemsArchived = <Item>[].obs;
  List<Item> get currentUserItemsArchived => _currentUserItemsArchived;
  set currentUserItemsArchived(List<Item> value) =>
      _currentUserItemsArchived.assignAll(value);

  final RxString _itemActiveState = 'active'.obs;
  String get itemActiveState => _itemActiveState.value;
  set itemActiveState(String value) => _itemActiveState.value = value;

  final RxString _profileImage = ''.obs;
  String get profileImage => _profileImage.value;
  set profileImage(String value) => _profileImage.value = value;
  File? image;

  /// INIT

  @override
  Future<void> onInit() async {
    super.onInit();
    addListeners();
    currentUserData = await firebaseService.getCurrentUserData();
    currentUserItems = await firebaseService.getCurrentUserItems();
    sortCurrentUserItems();
    logger.wtf(currentUserItemsActive);
    logger.w(currentUserItemsArchived);
    logger.e(currentUserItems);
    // final userID = FirebaseAuth.instance.currentUser!.uid;

    // allItems = await firebaseService.getAllItems() ?? [];

    userNameController.text = currentUserData.username;
    descriptionController.text = currentUserData.description;
    profileImage = currentUserData.profilePicture ?? '';
    logger.e(currentUserData);
  }

  ///

  /// METHODS

  void addListeners() {
    //ovaj listener sluzi za saveanje imena predmeta
    userNameController.addListener(() {
      userNameIsEmpty = userNameController.text.isNotEmpty &&
          userNameController.text.length > 3;
    });
    descriptionController.addListener(() {
      descriptionIsEmpty = descriptionController.text.isNotEmpty &&
          descriptionController.text.length > 3;
    });
  }

  Future<void> pickUserProfileImage() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedImage == null) return;
      final imageTemporary = File(pickedImage!.path);

      image = imageTemporary;
    } on PlatformException catch (e) {
      print('Failed to pick image $e');
    }
  }

  Future<void> updateUsernameAndDescription() async {
    await firebaseService.updateUserData({
      'username': userNameController.text,
      'description': descriptionController.text
    });
    currentUserData = currentUserData.copyWith(
        username: userNameController.text,
        description: descriptionController.text,
        profilePicture: profileImage);
  }

  Future<void> changeProfilePicture() async {
    await pickUserProfileImage();
    logger.e('1');
    profileImage = await firebaseService.uploadProfilePicture(image!);
    logger.w(profileImage);
    await firebaseService.updateUserData({'profile_picture': profileImage});
    logger.wtf(3);
  }

  Future<void> changeItemStatus(String itemID, String status) async {
    await firebaseService.updateItemData({'item_state': status}, itemID);
  }

  void printUID() {
    print(FirebaseAuth.instance.currentUser!.uid);
  }

  Future<void> signOutUser() async {
    await firebaseService.logOut();
    Get.offAllNamed(MyRoutes.authentificationScreen);
  }

  void sortCurrentUserItems() {
    currentUserItemsActive.clear();
    currentUserItemsArchived.clear();
    for (final item in currentUserItems) {
      if (item.itemState == 'active') {
        currentUserItemsActive.add(item);
      } else if (item.itemState == 'archived') {
        currentUserItemsArchived.add(item);
      }
    }
  }

  changeItemStateToArchived(index) {
    final currentItem = currentUserItemsActive.elementAt(index);
    final itemID = currentItem.itemID;
    print(currentItem.itemID);
    changeItemStatus(itemID, 'archived');
    removeFromActiveList(currentItem);
  }

  Future<void> deleteCurrentItem(index) async {
    final currentItem = currentUserItemsArchived.elementAt(index);
    final itemID = currentItem.itemID;
    // await firebaseService.deleteMatchedItemsFromDifferentUsers(itemID);

    for (final image in currentItem.itemPictureList!) {
      await firebaseService.deleteItemImagesFromStorage(image);
    }
    await firebaseService.deleteCurrentUserItems(itemID);
    firebaseService.deleteAllMatchesWithItemID(itemID);
    currentUserItemsArchived.remove(currentItem);
  }

  void removeFromActiveList(Item item) {
    currentUserItemsActive.remove(item);
    currentUserItemsArchived.add(item);
  }

  void removeFromArchivedList(Item item) {
    currentUserItemsArchived.remove(item);
    currentUserItemsActive.add(item);
  }
}
