import 'package:bloomi_web/components/conversation_tile.dart';
import 'package:bloomi_web/components/header_widget.dart';
import 'package:bloomi_web/providers/user_home_provider/user_chat.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Conversation extends StatefulWidget {
  const Conversation({super.key});

  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final List<String> names = [
      "Sarah Smith",
      "Michael Johnson",
      "Emily Davis",
      "Daniel Martinez",
      "Jessica Wilson"
    ];

    final List<String> messages = [
      "Hi there! How can I help you?",
      "Don't forget our meeting at 3 PM today.",
      "Great job on completing the tasks!",
      "What's the status of the project?",
      "Please review the latest code changes."
    ];

    List<String> timeList = [
      "5 minutes ago",
      "15 minutes ago",
      "30 minutes ago",
      "45 minutes ago",
      "1 hour ago",
    ];
    return SafeArea(
      child: Column(
        children: [
          const HeaderWidget(isTrue: false),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  width: 500,
                  height: height - 152,
                  color: UtilConstants.lightgreyColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: InkWell(
                              onTap: () {
                                Provider.of<UserChatProvider>(context,
                                        listen: false)
                                    .changeIndex(index);
                              },
                              child: ConversationTile(
                                name: names[index],
                                messages: messages[index],
                                time: timeList[index],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: SizedBox(height: 2),
                          );
                        },
                        itemCount: 5),
                  ),
                ),
                const SizedBox(width: 4),
                Container(
                  width: width - 522,
                  height: height - 152,
                  color: UtilConstants.lightgreyColor,
                  child: Consumer<UserChatProvider>(
                    builder: (context, value, child) {
                      return Column(
                        children: [
                          HeaderWidget(
                            name: names[value.getIndex],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              width: width - 530,
                              height: height - 152 - 80,
                              color: UtilConstants.whiteColor,
                              child: ListView.builder(
                                itemCount:
                                    1, // Replace with the actual item count
                                itemBuilder: (context, index) {
                                  // Replace this with your desired list item widget
                                  return ListTile(
                                    title:
                                        Text(messages[value.getIndex] ?? " "),

                                    // Customize your list item as needed
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
