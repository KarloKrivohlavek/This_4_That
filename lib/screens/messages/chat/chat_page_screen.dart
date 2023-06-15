import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:this_4_that/models/message/message.dart';
import 'package:this_4_that/screens/messages/chat/widgets/message_bubble.dart';
import 'package:this_4_that/services/firebase_service.dart';

import 'chat_page_controller.dart';

///
/// This is a screen in which we write widgets concerning [HelloScreen]
///

class ChatPageScreen extends GetView<ChatPageController> {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('appName'.tr),
      ),
      body: Column(
        children: [
          Center(
            child: Text(controller.chatID),
          ),
          GestureDetector(
            onTap: () async {
              final newMesssage = Message(
                  senderID: FirebaseAuth.instance.currentUser!.uid,
                  text: 'Ovo je nova poruka potpuno drugacija',
                  createdAt: DateTime.now().millisecondsSinceEpoch);
              await FirebaseService.instance.firebaseFirestore
                  .collection('chats')
                  .doc(controller.chatID)
                  .collection('messages')
                  .add(newMesssage.toJson());
            },
            child: Container(
              color: Colors.red,
              height: 120,
            ),
          ),
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
                  // for (final message in messages!) {
                  //   final messageTextKey = message.data()['text'];
                  //   // final messageText =
                  //   messagesList.add(Text(messageTextKey));
                  // }

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
                    );
                    messagesList.add(messageBubble);
                  }
                }
                return Expanded(
                    child: Center(
                        child: ListView(
                  children: messagesList,
                  reverse: true,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                )));
              })
        ],
      ));
}
