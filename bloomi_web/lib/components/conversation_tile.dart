import 'package:bloomi_web/components/conversation_image.dart';
import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class ConversationTile extends StatelessWidget {
  const ConversationTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 50,
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
              const ConversationImage(),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    "Kamal Dissanayaka",
                    fontSize: 18,
                    fontColor: UtilConstants.blackColor,
                  ),
                  CustomText(
                    "How are you?",
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontColor: UtilConstants.blackColor.withOpacity(0.5),
                  ),
                ],
              ),
            ],
          ),
          CustomText(
            "1 min ago",
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontColor: UtilConstants.blackColor.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
