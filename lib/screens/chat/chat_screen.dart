import 'package:firebase_auth_db/constants.dart';
import 'package:firebase_auth_db/services/functions.dart';
import 'package:flutter/material.dart';


import 'components/body.dart';

class ChatScreen extends StatefulWidget {
  final String help;

  const ChatScreen({Key? key, required this.help})
      : super(key: key);
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override

  final functions = CloudFunctions();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(help: widget.help),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          const BackButton(),
          const SizedBox(width: kDefaultPadding * 2),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Ligação de emergência",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Ligar para o CVV",
                style: TextStyle(fontSize: 12),
              )
            ],
          )
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.local_phone),
          onPressed: () {
            // 
          },
        ),
        const SizedBox(width: kDefaultPadding / 2),
      ],
    );
  }
}
