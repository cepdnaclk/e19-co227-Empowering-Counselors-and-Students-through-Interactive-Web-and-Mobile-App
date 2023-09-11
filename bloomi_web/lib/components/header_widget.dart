import 'package:bloomi_web/components/conversation_image.dart';
import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.mediaQueryData,
  });

  final MediaQueryData mediaQueryData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: mediaQueryData.size.width * 0.01),
      width: mediaQueryData.size.width,
      height: mediaQueryData.size.height * 0.09,
      color: UtilConstants.lightgreyColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ConversationImage(mediaQueryData: mediaQueryData),
              SizedBox(width: mediaQueryData.size.width * 0.01),
              CustomText(
                "Sachith Dissanayaka",
                fontSize: mediaQueryData.size.width * 0.015,
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.video_call_rounded,
              color: UtilConstants.primaryColor,
              size: mediaQueryData.size.width * 0.03,
            ),
          )
        ],
      ),
    );
  }
}
