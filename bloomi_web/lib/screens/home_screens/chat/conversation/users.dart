import 'package:bloomi_web/components/conversation_tile.dart';
import 'package:bloomi_web/components/header_widget.dart';
import 'package:flutter/material.dart';

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
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
