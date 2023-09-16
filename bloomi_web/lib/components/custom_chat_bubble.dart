import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    this.isSender = false,
  });

  final bool isSender;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        BubbleSpecialThree(
          text: 'Hii.. Akilaa How are you?',
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
            "1 min ago",
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontColor: UtilConstants.blackColor.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
