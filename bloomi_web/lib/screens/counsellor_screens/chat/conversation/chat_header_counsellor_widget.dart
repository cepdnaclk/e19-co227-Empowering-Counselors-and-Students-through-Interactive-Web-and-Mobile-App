import 'package:bloomi_web/components/chat_list_view_user.dart';
import 'package:bloomi_web/components/conversation_image.dart';
import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/providers/user_home_provider/user_chat.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:bloomi_web/utils/util_function.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatHeaderCounsellorWidget extends StatelessWidget {
  const ChatHeaderCounsellorWidget({
    super.key,
    this.isTrue = true,
  });

  final bool isTrue;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      width: width,
      height: 70,
      color: UtilConstants.tropicalBlurColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Consumer<UserChatProvider>(
            builder: (context, value, child) {
              return Row(
                children: [
                  ConversationImage(
                    imagePath: (value.getIndex == -1)
                        ? UtilConstants.dummyProfileUrl
                        : value.getConversationModelNew.usersArray[1].img,
                  ),
                  const SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        (value.getIndex == -1)
                            ? ""
                            : value.getConversationModelNew.usersArray[1].name,
                        fontSize: 20,
                        fontColor: UtilConstants.blackColor,
                      ),
                      CustomText(
                        (value.getIndex == -1)
                            ? ""
                            : UtilFunction.getTimeAgo(
                                value.getConversationModelNew.usersArray[1]
                                    .lastSeen,
                              ),
                        fontSize: 10,
                        fontColor: UtilConstants.blackColor,
                      ),
                    ],
                  ),
                  const SizedBox(width: 4),
                  (value.getIndex == -1)
                      ? const Text("")
                      : Icon(
                          Icons.circle_rounded,
                          color: UtilConstants.greenColor,
                          size: 10,
                        )
                ],
              );
            },
          ),
          isTrue
              ? Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.call,
                        color: UtilConstants.blackColor,
                        size: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.video_call_rounded,
                        color: UtilConstants.blackColor,
                        size: 40,
                      ),
                    ),
                  ],
                )
              : IconButton(
                  onPressed: () {
                    UtilFunction.navigateForward(
                        context, const ChatListViewUser());
                  },
                  icon: const Icon(
                    Icons.people_alt_rounded,
                    color: UtilConstants.blackColor,
                    size: 40,
                  ),
                ),
        ],
      ),
    );
  }
}
