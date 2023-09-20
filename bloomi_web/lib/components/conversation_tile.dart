import 'package:bloomi_web/components/conversation_image.dart';
import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/models/objects.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class ConversationTile extends StatelessWidget {
  const ConversationTile({
    super.key,
    required this.chatModel,
  });

  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
        color: UtilConstants.whiteColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ConversationImage(
                imagePath: chatModel.img,
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomText(
                        chatModel.name,
                        fontSize: 18,
                        fontColor: UtilConstants.blackColor,
                      ),
                      const SizedBox(width: 5),
                      Icon(Icons.circle_rounded,
                          size: 8,
                          color: chatModel.isOnline
                              ? UtilConstants.greenColor
                              : UtilConstants.greyColor)
                    ],
                  ),
                  CustomText(
                    "Hiii",
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontColor: UtilConstants.blackColor.withOpacity(0.5),
                  ),
                ],
              ),
            ],
          ),
          CustomText(
            timeago.format(DateTime.parse(chatModel.lastSeen),
                allowFromNow: true),
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontColor: UtilConstants.blackColor.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
