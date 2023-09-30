import 'package:bloomi_web/components/footer.dart';
import 'package:bloomi_web/providers/user_home_provider/user_chat.dart';
import 'package:bloomi_web/providers/users/user_provider.dart';
import 'package:bloomi_web/screens/home_screens/chat/conversation/available_chat.dart';
import 'package:bloomi_web/screens/home_screens/chat/conversation/custom_chat_screen.dart';
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

    double widthFinal = (width > 1000) ? width - 220 : width;
    double heightFinal = (width > 1000) ? height - 125 : height - 54;

    return VisibilityDetector(
      key: const Key('conversation_key'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction == 0) {
          _userProvider.updateUserOnlineState(false);
        } else {
          _userProvider.updateUserOnlineState(true);
        }
      },
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: (width > 1000)
                    ? Row(
                        children: [
                          AvailableChat(
                            isMobile: false,
                            height: heightFinal,
                            width: widthFinal,
                          ),
                          const SizedBox(width: 4),
                          Consumer<UserChatProvider>(
                            builder: (context, value, child) {
                              Logger().e(value.getIndex);

                              //----------------this is used to make when user dont have any convercation then show the empty screen----------------
                              return (value.getIndex == -1)
                                  ? CustomChatScreen(
                                      isMobile: false,
                                      width: widthFinal,
                                      height: heightFinal,
                                      conId: "")
                                  : CustomChatScreen(
                                      isMobile: false,
                                      width: widthFinal,
                                      height: heightFinal,
                                      conId: value.getConversationModelNew.id);
                            },
                          )
                        ],
                      )
                    : Column(
                        children: [
                          AvailableChat(
                            isMobile: true,
                            height: heightFinal,
                            width: widthFinal,
                          ),
                          const SizedBox(width: 4),
                          // ChatScreenCustom(widthFinal: widthFinal, heightFinal: heightFinal)
                        ],
                      ),
              ),
              Footer(height: 55, width: width)
            ],
          ),
        ),
      ),
    );
  }
}
