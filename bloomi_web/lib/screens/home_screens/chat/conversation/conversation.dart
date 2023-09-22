import 'package:bloomi_web/components/available_chat.dart';
import 'package:bloomi_web/components/custom_chat_screen.dart';
import 'package:bloomi_web/components/header_widget.dart';
import 'package:bloomi_web/providers/user_home_provider/user_chat.dart';
import 'package:bloomi_web/providers/users/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

class Conversation extends StatefulWidget {
  @override
  const Conversation({
    super.key,
  });

  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation>
    with WidgetsBindingObserver {
  late UserProvider _userProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _userProvider = Provider.of<UserProvider>(context,
        listen: false); // Save a reference to the provider
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    // Wrap your existing Conversation widget with VisibilityDetector
    return VisibilityDetector(
      key: const Key('conversation_key'), // Use a unique key for each instance
      onVisibilityChanged: (info) {
        if (info.visibleFraction == 0) {
          _userProvider.updateUserOnlineState(false); // Use the saved reference
        } else {
          _userProvider.updateUserOnlineState(true); // Use the saved reference
        }
      },
      child: SafeArea(
        child: Column(
          children: [
            const HeaderWidget(isTrue: false),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  AvailableChat(height: height),
                  const SizedBox(width: 4),
                  Consumer<UserChatProvider>(
                    builder: (context, value, child) {
                      Logger().e(value.getIndex);
                      return (value.getIndex == -1)
                          ? CustomChatScreen(
                              width: width, height: height, conId: "")
                          : CustomChatScreen(
                              width: width,
                              height: height,
                              conId: value.getConversationModelNew.id);
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
