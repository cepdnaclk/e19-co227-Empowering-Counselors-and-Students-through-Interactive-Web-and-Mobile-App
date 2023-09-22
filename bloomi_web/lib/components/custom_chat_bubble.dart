import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/models/objects.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:bloomi_web/utils/util_function.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    this.isSender = false,
    required this.messageModel,
  });

  final bool isSender;

  final MessageModel messageModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        BubbleSpecialThree(
          text: messageModel.message,
          color:
              isSender ? UtilConstants.primaryColor : UtilConstants.greyColor,
          delivered: true,
          sent: true,
          seen: true,
          textStyle: const TextStyle(color: Colors.white, fontSize: 16),
          isSender: isSender,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: CustomText(
            UtilFunction.getTimeAgo(messageModel.messageTime),
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontColor: UtilConstants.blackColor.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
