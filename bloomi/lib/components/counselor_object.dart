import 'package:bloomi/components/custom_text.dart';
import 'package:bloomi/utils/util_constant.dart';
import 'package:flutter/material.dart';

class CounselorObject extends StatelessWidget {
  const CounselorObject({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          color: UtilConstants.lightgreyColor,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          const SizedBox(width: 20),
          SizedBox(
            width: 80,
            height: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                UtilConstants.profImagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 20),
          const Column(
            children: [
              SizedBox(height: 20),
              CustomText(
                "Prof. UnKnow",
                fontSize: 18,
                fontColor: UtilConstants.blackColor,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 10),
              CustomText(
                "Deparment of computer engineering",
                fontSize: 14,
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
