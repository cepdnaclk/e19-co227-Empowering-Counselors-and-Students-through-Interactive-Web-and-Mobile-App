import 'package:bloomi_web/components/conversation_image.dart';
import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    this.isTrue = true,
    this.name = "Sachith Dissanayaka",
  });

  final bool isTrue;
  final String name;

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
          Row(
            children: [
              const ConversationImage(),
              const SizedBox(width: 20),
              CustomText(
                name,
                fontSize: 20,
                fontColor: UtilConstants.blackColor,
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.circle_rounded,
                color: UtilConstants.greenColor,
                size: 10,
              )
            ],
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
                  onPressed: () {},
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
