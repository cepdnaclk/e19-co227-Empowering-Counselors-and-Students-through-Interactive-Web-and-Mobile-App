import 'package:bloomi_web/providers/user_home_provider/user_chat.dart';
import 'package:bloomi_web/screens/counsellor_screens/chat/conversation/custom_chat_screen_counsellor.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class CustomChatView extends StatelessWidget {
  const CustomChatView({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserChatProvider>(
      builder: (context, value, child) {
        Logger().e(value.getIndex);

        //----------------this is used to make when user dont have any convercation then show the empty screen----------------
        return (value.getIndex == -1)
            ? CustomChatScreenCounsellor(
                width: width,
                height: height,
                getIndex: value.getIndex,
                isMobile: true,
                conId: "")
            : CustomChatScreenCounsellor(
                width: width,
                height: height,
                getIndex: value.getIndex,
                isMobile: true,
                conId: value.getConversationModelNew.id);
      },
    );
  }
}
