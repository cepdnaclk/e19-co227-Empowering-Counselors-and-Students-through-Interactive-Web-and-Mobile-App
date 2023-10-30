import 'package:bloomi_web/components/footer.dart';
import 'package:bloomi_web/providers/user_home_provider/user_chat.dart';
import 'package:bloomi_web/screens/home_screens/chat/conversation/custom_chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class ChatScreenMobile extends StatelessWidget {
  const ChatScreenMobile({
    super.key,
    required this.widthFinal,
    required this.heightFinal,
  });

  final double widthFinal;
  final double heightFinal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Consumer<UserChatProvider>(
              builder: (context, value, child) {
                Logger().e(value.getIndex);

                //----------------this is used to make when user dont have any conversation then show the empty screen----------------
                return (value.getIndex == -1)
                    ? CustomChatScreen(
                        isMobile: true,
                        width: widthFinal,
                        height: heightFinal,
                        conId: "")
                    : CustomChatScreen(
                        isMobile: true,
                        width: widthFinal,
                        height: heightFinal,
                        conId: value.getConversationModelNew.id);
              },
            ),
          ),
          Footer(height: 55, width: widthFinal)
        ],
      ),
    );
  }
}
