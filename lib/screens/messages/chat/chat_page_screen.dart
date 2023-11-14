import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/pages.dart';
import 'package:this_4_that/screens/messages/chat/widgets/custom_appbar.dart';
import 'package:this_4_that/screens/messages/chat/widgets/message_bubble.dart';
import 'package:this_4_that/services/firebase_service.dart';

import 'chat_page_controller.dart';

///
/// This is a screen in which we write widgets concerning [HelloScreen]
///

class ChatPageScreen extends GetView<ChatPageController> {
  const ChatPageScreen({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
            appBar: CustomAppBar(
                image1: controller.currentUserItemImageURL(),
                // controller.isCurrentUserFirstUserBool
                //     ? controller.match.item1PictureURL
                //     : controller.match.item2PictureURL,
                image2: controller.differentUserItemImageURL(),
                // controller.isCurrentUserFirstUserBool
                //     ? controller.match.item2PictureURL
                //     : controller.match.item1PictureURL,
                differentUsername: controller.differentUserUsername()
                // controller.isCurrentUserFirstUserBool
                //     ? controller.match.user2Username
                //     : controller.match.user1Username
                ),
            body: Column(
              children: [
                StreamBuilder(
                    stream: FirebaseService.instance.firebaseFirestore
                        .collection('chats')
                        .doc(controller.chatID)
                        .collection('messages')
                        .orderBy('created_at')
                        .snapshots(),
                    builder: (context, snapshot) {
                      // List<Text> messagesList = [];
                      List<MessageBubble> messagesList = [];
                      if (snapshot.hasData) {
                        final messages = snapshot.data?.docs.reversed;

                        for (final message in messages!) {
                          final messageText = message.data()['text'];
                          final messageSender = message.data()['sender_ID'];
                          final messageTime = message.data()['created_at'];

                          final dateTime =
                              DateTime.fromMillisecondsSinceEpoch(messageTime);
                          final messageSendTime =
                              '${dateTime.hour}:${dateTime.minute} - ${dateTime.day}/${dateTime.month}/${dateTime.year}';
                          final messageBubble = MessageBubble(
                            time: messageSendTime,
                            text: messageText,
                            isMe: messageSender ==
                                FirebaseAuth.instance.currentUser!.uid,
                            isDefaultUser: messageSender == 'default',
                          );
                          messagesList.add(messageBubble);
                        }
                      }
                      return Expanded(
                          child: Center(
                              child: ListView(
                        reverse: true,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        children: messagesList,
                      )));
                    }),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    onTap: () {},
                    controller: controller.messageController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 3, color: MyColors.grey),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 3, color: MyColors.orange),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      hintText: 'Poruka...',
                      suffixIcon: (IconButton(
                        icon: const Icon(
                          MdiIcons.send,
                        ),
                        onPressed: () {
                          controller.sendMessage();
                        },
                        color: MyColors.orange,
                      )),
                    ),
                  ),
                ),
              ],
            )),
      );
}
