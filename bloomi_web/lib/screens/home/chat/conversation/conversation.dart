import 'package:bloomi_web/components/conversation_tile.dart';
import 'package:bloomi_web/components/header_widget.dart';
import 'package:flutter/material.dart';

class Conversation extends StatefulWidget {
  const Conversation({super.key});

  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Column(
        children: [
          const HeaderWidget(),
          const SizedBox(height: 30),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return ConversationTile(mediaQueryData: mediaQueryData);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: mediaQueryData.size.height * 0.01);
                },
                itemCount: 10),
          )
        ],
      ),
    );
  }
}
