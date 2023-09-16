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
    return SafeArea(
      child: Column(
        children: [
          const HeaderWidget(),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: ConversationTile(),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(height: 2),
                  );
                },
                itemCount: 1),
          )
        ],
      ),
    );
  }
}
