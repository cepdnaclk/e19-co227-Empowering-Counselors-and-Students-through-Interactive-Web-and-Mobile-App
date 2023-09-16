import 'package:bloomi_web/components/conversation_image.dart';
import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class ConversationTile extends StatelessWidget {
  const ConversationTile({
    super.key,
    required this.mediaQueryData,
  });

  final MediaQueryData mediaQueryData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: mediaQueryData.size.width * 0.04,
        vertical: mediaQueryData.size.height * 0.02,
      ),
      decoration: const BoxDecoration(
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
              const ConversationImage(),
              SizedBox(width: mediaQueryData.size.width * 0.01),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    "Kamal Dissanayaka",
                    fontSize: mediaQueryData.size.width * 0.015,
                  ),
                  CustomText(
                    "How are you?",
                    fontSize: mediaQueryData.size.width * 0.009,
                    fontWeight: FontWeight.w400,
                    fontColor: UtilConstants.lightgreyColor,
                  ),
                ],
              ),
            ],
          ),
          CustomText(
            "1 min ago",
            fontSize: mediaQueryData.size.width * 0.01,
            fontWeight: FontWeight.w400,
            fontColor: UtilConstants.lightgreyColor,
          ),
        ],
      ),
    );
  }
}
