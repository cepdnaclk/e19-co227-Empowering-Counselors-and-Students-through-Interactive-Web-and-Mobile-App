import 'package:bloomi_web/components/footer.dart';
import 'package:bloomi_web/screens/home/home/chat/conversation/conversation.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      body: const Conversation(),
      bottomNavigationBar: Footer(mediaQueryData: mediaQueryData),
    );
  }
}
