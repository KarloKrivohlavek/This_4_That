import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:this_4_that/services/firebase_service.dart';
import 'package:this_4_that/services/logger_service.dart';

import '../../models/item/item.dart';
import '../../models/user/user.dart';

class ProfilePageController extends GetxController {
  /// DEPENDENCIES

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

  final logger = Get.find<LoggerService>();

  final firebaseService = Get.find<FirebaseService>();

  /// INIT

  @override
  Future<void> onInit() async {
    super.onInit();
    currentUserData = await firebaseService.getCurrentUserData();
    currentUserItems = await firebaseService.getCurrentUserItems();
    logger.e(currentUserItems);
    // final userID = FirebaseAuth.instance.currentUser!.uid;

    // allItems = await firebaseService.getAllItems() ?? [];

    logger.e(currentUserData);
  }

  ///
  /// METHODS
}
