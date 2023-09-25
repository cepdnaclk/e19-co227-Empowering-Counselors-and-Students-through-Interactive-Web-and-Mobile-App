import 'package:bloomi_web/screens/counsellor_screens/chat/conversation/conversation_counsellor.dart';
import 'package:flutter/material.dart';

class ChatCounsellor extends StatefulWidget {
  const ChatCounsellor({super.key});

  @override
  State<ChatCounsellor> createState() => _ChatCounsellorState();
}

class _ChatCounsellorState extends State<ChatCounsellor> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ConversationCounsellor(),
    );
  }
}
