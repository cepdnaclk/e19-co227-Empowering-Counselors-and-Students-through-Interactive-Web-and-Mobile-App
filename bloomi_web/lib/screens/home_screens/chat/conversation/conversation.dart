import 'package:bloomi_web/components/chat_list_view_user.dart';
import 'package:bloomi_web/components/custom_chat_bubble.dart';
import 'package:bloomi_web/components/header_widget.dart';
import 'package:bloomi_web/components/messagetyping_widget.dart';
import 'package:bloomi_web/providers/user_home_provider/user_chat.dart';
import 'package:bloomi_web/providers/users/user_provider.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class Conversation extends StatefulWidget {
  @override
  const Conversation({super.key});

  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  //--------------to check app state----------------------
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    Logger().w(state.index);
    if (state.index == 1) {
      Logger().e("Hiiiii");
      Provider.of<UserProvider>(context, listen: false)
          .updateUserOnlineState(true);
    }
    // switch (state.index) {
    //   case 1:
    //     Logger().e("Hiiiii");
    //     Provider.of<UserProvider>(context, listen: false)
    //         .updateUserOnlineState(true);
    //     break;
    //   case 0:
    //     Provider.of<UserProvider>(context, listen: false)
    //         .updateUserOnlineState(false);

    //     break;
    // }
  }

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
                ChatListViewUser(
                    height: height,
                    names: names,
                    messages: messages,
                    timeList: timeList),
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
                              child: Column(
                                children: [
                                  Expanded(
                                      child: ListView.separated(
                                          itemBuilder: (context, index) {
                                            return const ChatBubble();
                                          },
                                          separatorBuilder: (context, index) {
                                            return const SizedBox(height: 10);
                                          },
                                          itemCount: 20)),
                                  const MessageTypingWidget(),
                                ],
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
