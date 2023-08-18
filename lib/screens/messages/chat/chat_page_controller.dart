import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:this_4_that/models/match/match.dart';
import 'package:this_4_that/models/message/message.dart';
import 'package:this_4_that/services/firebase_service.dart';
import 'package:this_4_that/services/logger_service.dart';

class ChatPageController extends GetxController {
  /// DEPENDENCIES

  ///REACTIVE VARIABLES

  final firebaseService = Get.find<FirebaseService>();
  final logger = Get.find<LoggerService>();
  final messageController = TextEditingController();
  bool isCurrentUserFirstUserBool = true;

  /// INIT

  String chatID = '';
  MatchedItems match = MatchedItems(
      item1Name: '',
      item2Name: '',
      user1Username: '',
      user2Username: '',
      item1PictureURL: '',
      item2PictureURL: '',
      user1ID: '',
      user2ID: '',
      item1ID: '',
      item2ID: '',
      matchID: '',
      chatID: '');
  @override
  Future<void> onInit() async {
    super.onInit();
    checkArguments();
    chatID = match.chatID;
    logger.e(match);
    logger.w(chatID);
    isCurrentUserFirstUserBool = isCurrentUserFirstUser();
    messageController.addListener(() {});
  }

  ///
  /// METHODS

  Future<void> sendMessage() async {
    final newMessage = Message(
        senderID: FirebaseAuth.instance.currentUser!.uid,
        text: messageController.text,
        createdAt: DateTime.now().millisecondsSinceEpoch);
    if (messageController.text.isNotEmpty) {
      await firebaseService.sendNewMessage(newMessage, chatID);
      messageController.clear();
    }
  }

  bool isCurrentUserFirstUser() {
    if (match.user1ID == FirebaseAuth.instance.currentUser?.uid) {
      return true;
    }
    return false;
  }

  String differentUserItemImageURL() {
    String differentUserImageURL;
    if (isCurrentUserFirstUserBool) {
      differentUserImageURL = match.item1PictureURL;
    }
    differentUserImageURL = match.item2PictureURL;
    return differentUserImageURL;
  }

  String differentUserUsername() {
    String differentUserImageURL;
    if (isCurrentUserFirstUserBool) {
      differentUserImageURL = match.user1Username;
    }
    differentUserImageURL = match.user2Username;
    return differentUserImageURL;
  }

  String currentUserItemImageURL() {
    String differentUserImageURL;
    if (isCurrentUserFirstUserBool) {
      differentUserImageURL = match.item2PictureURL;
    }
    differentUserImageURL = match.item1PictureURL;
    return differentUserImageURL;
  }

  // controller.isCurrentUserFirstUserBool
  // ? controller.match.user2Username
  //     : controller.match.user1Username

  void checkArguments() {
    if (Get.arguments != null) {
      final matchedItemKey = Get.arguments.keys
          .firstWhere((key) => key == 'matchedItem', orElse: () => '');
      if (matchedItemKey.isNotEmpty) {
        match = Get.arguments[matchedItemKey];
      }
    }
  }
}
