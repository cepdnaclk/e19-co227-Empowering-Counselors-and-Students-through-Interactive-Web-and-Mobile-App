import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class CounselorObject extends StatelessWidget {
  final MediaQueryData mediaQueryData;
  const CounselorObject({
    super.key,
    required this.mediaQueryData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaQueryData.size.height * 0.12,
      width: 780,
      decoration: BoxDecoration(
          color: UtilConstants.lightgreyColor,
          borderRadius:
              BorderRadius.circular(mediaQueryData.size.height * 0.01)),
      child: Row(
        children: [
          SizedBox(width: mediaQueryData.size.height * 0.017),
          SizedBox(
            width: mediaQueryData.size.height * 0.08,
            height: mediaQueryData.size.height * 0.08,
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(mediaQueryData.size.height * 0.05),
              child: Image.asset(
                UtilConstants.profImagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: mediaQueryData.size.width * 0.08),
          Column(
            children: [
              SizedBox(height: mediaQueryData.size.height * 0.025),
              CustomText(
                "Prof. UnKnow",
                fontSize: mediaQueryData.size.height * 0.025,
                fontColor: UtilConstants.blackColor,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: mediaQueryData.size.height * 0.013),
              CustomText(
                "Deparment of computer engineering",
                fontSize: mediaQueryData.size.height * 0.014,
                fontColor: UtilConstants.blackColor,
                fontWeight: FontWeight.w400,
              ),
            ],
          )
        ],
      ),
    );
  }
}
