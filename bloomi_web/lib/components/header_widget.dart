import 'package:bloomi_web/components/conversation_image.dart';
import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      width: width,
      height: 55,
      color: UtilConstants.lightgreyColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              ConversationImage(),
              SizedBox(width: 20),
              CustomText(
                "Sachith Dissanayaka",
                fontSize: 15,
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.people_alt_rounded,
                  color: UtilConstants.primaryColor,
                  size: 20,
                ),
              ),
              const SizedBox(width: 20),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.video_call_rounded,
                  color: UtilConstants.primaryColor,
                  size: 20,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
