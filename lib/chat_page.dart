import 'package:flutter/material.dart';
import 'package:this_4_that/chatMessagePreview.dart';

class ChatPage extends StatelessWidget {
  final List _messages = [
    'message 1',
    'message 2',
    'message 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: _messages.length,
          itemBuilder: (context, index) {
            return MessagePreview();
          },
        ),
      ),
    );
  }
}
