import 'package:bloomi_web/providers/admin/counselor_registration_provider.dart';
import 'package:bloomi_web/providers/user_home_provider/user_chat.dart';
import 'package:bloomi_web/screens/counsellor_screens/chat/conversation/available_chat_counsellor.dart';
import 'package:bloomi_web/screens/counsellor_screens/chat/conversation/custom_chat_screen_counsellor.dart';
import 'package:bloomi_web/screens/counsellor_screens/chat/conversation/header_widget_counsellor.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ConversationCounsellor extends StatefulWidget {
  @override
  const ConversationCounsellor({
    super.key,
  });

  @override
  State<ConversationCounsellor> createState() => _ConversationCounsellorState();
}

class _ConversationCounsellorState extends State<ConversationCounsellor>
    with WidgetsBindingObserver {
  late CounsellorRegistrationProvider _counsellorRegistrationProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _counsellorRegistrationProvider =
        Provider.of<CounsellorRegistrationProvider>(context,
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
          _counsellorRegistrationProvider
              .updateCounsellorOnlineState(false); // Use the saved reference
        } else {
          _counsellorRegistrationProvider
              .updateCounsellorOnlineState(true); // Use the saved reference
        }
      },
      child: SafeArea(
        child: Column(
          children: [
            const HeaderWidgetCounsellor(isTrue: false),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  AvailableChatCounsellor(height: height - 59),
                  const SizedBox(width: 4),
                  Consumer<UserChatProvider>(
                    builder: (context, value, child) {
                      Logger().e(value.getIndex);

                      //----------------this is used to make when user dont have any convercation then show the empty screen----------------
                      return (value.getIndex == -1)
                          ? CustomChatScreenCounsellor(
                              width: width - 200,
                              height: height - 59,
                              getIndex: value.getIndex,
                              conId: "")
                          : CustomChatScreenCounsellor(
                              width: width - 200,
                              height: height - 59,
                              getIndex: value.getIndex,
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
