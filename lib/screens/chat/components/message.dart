import 'package:firebase_auth_db/models/ChatMessage.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth_db/constants.dart';
import 'text_message.dart';

class Message extends StatelessWidget {
  const Message({
    Key? key,
    required this.message,
  }) : super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    Widget messageContent(ChatMessage message) {
      switch (message.messageType) {
        case ChatMessageType.text:
          return TextMessage(message: message);
        default:
          return SizedBox();
      }
    }

    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Row(
        mainAxisAlignment:
            message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message.isSender) ...[
            Icon(Icons.account_circle, color: kPrimaryColor),
            SizedBox(width: kDefaultPadding / 2),
          ],
          messageContent(message),
        ],
      ),
    );
  }
}