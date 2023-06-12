import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  List<Item> allItems = [];

  final Rx<UserData> _currentUserData = UserData(
          dateOfBirth: '',
          description: '',
          fullName: '',
          location: '',
          userID: '',
          username: '')
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

  /// INIT

  @override
  Future<void> onInit() async {
    super.onInit();
    currentUserData = await firebaseService.getCurrentUserData();
    currentUserItems = await firebaseService.getCurrentUserItems();
    sortCurrentUserItems();
    logger.wtf(currentUserItemsActive);
    logger.w(currentUserItemsArchived);
    logger.e(currentUserItems);
    // final userID = FirebaseAuth.instance.currentUser!.uid;

    // allItems = await firebaseService.getAllItems() ?? [];

    logger.e(currentUserData);
  }

  ///

  /// METHODS

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

  void deleteCurrentItem(index) {
    final currentItem = currentUserItemsActive.elementAt(index);
    final itemID = currentItem.itemID;
    firebaseService.deleteCurrentUserItems(itemID);
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
