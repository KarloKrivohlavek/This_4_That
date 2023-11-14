import 'package:flutter/material.dart';
import 'package:this_4_that/constants/colors.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble(
      {super.key,
      required this.time,
      required this.text,
      required this.isMe,
      required this.isDefaultUser});

  final String time;
  final String text;
  final bool isMe;

  final bool isDefaultUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isDefaultUser
            ? CrossAxisAlignment.center
            : isMe
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            time,
            style: TextStyle(
              fontSize: 12.0,
              color: isDefaultUser ? Colors.transparent : MyColors.black,
            ),
          ),
          Material(
            shadowColor: Colors.transparent,
            borderRadius: isDefaultUser
                ? const BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0))
                : isMe
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0))
                    : const BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
            elevation: 5.0,
            color: isDefaultUser
                ? Colors.transparent
                : isMe
                    ? MyColors.orange
                    : MyColors.grey,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                text,
                style: TextStyle(
                  color: isMe ? MyColors.white : MyColors.black,
                  fontSize: isDefaultUser ? 20.0 : 15.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
