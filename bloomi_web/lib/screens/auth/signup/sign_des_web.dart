import 'package:bloomi_web/components/custom_button.dart';
import 'package:bloomi_web/components/custom_image.dart';
import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/screens/auth/login/login.dart';
import 'package:bloomi_web/screens/auth/signup/signup_form.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:bloomi_web/utils/util_function.dart';
import 'package:flutter/material.dart';

class SignupDiscriptionWeb extends StatelessWidget {
  const SignupDiscriptionWeb({
    super.key,
    required this.mediaQueryData,
  });

  final MediaQueryData mediaQueryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: mediaQueryData.size.width * 0.025,
            vertical: mediaQueryData.size.height * 0.05,
          ),
          child: Center(
            child: Row(
              children: [
                Container(
                  height: mediaQueryData.size.height * 0.7,
                  width: mediaQueryData.size.width * 0.5,
                  decoration: BoxDecoration(
                    color: UtilConstants.lightBrownColor,
                    borderRadius: BorderRadius.circular(
                      mediaQueryData.size.height * 0.012,
                    ),
                  ),
                  child: const CustomImage(
                    imgPath: UtilConstants.counsellingImagePath,
                  ),
                ),
                SizedBox(width: mediaQueryData.size.width * 0.025),
                Column(
                  children: [
                    SizedBox(
                      width: mediaQueryData.size.width * 0.4,
                      child: CustomText(
                        "Create an account to seamlessly connect with a Counsellor,Explore Bloomi for better student-counselor education connections",
                        fontSize: mediaQueryData.size.height * 0.02,
                        textAlign: TextAlign.left,
                        fontColor: UtilConstants.blackColor,
                      ),
                    ),
                    SizedBox(height: mediaQueryData.size.height * 0.025),
                    InkWell(
                      onTap: () {
                        UtilFunction.navigateForward(context, const SignUp());
                      },
                      child: CustomButton(
                        "Get Started",
                        mediaQueryData: mediaQueryData,
                        width: mediaQueryData.size.width * 0.4,
                      ),
                    ),
                    SizedBox(height: mediaQueryData.size.height * 0.45),
                    InkWell(
                      onTap: () {
                        UtilFunction.navigateForward(context, const Login());
                      },
                      child: CustomText(
                        "Already have an account?",
                        fontColor: UtilConstants.primaryColor,
                        fontSize: mediaQueryData.size.height * 0.022,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
            height: mediaQueryData.size.height * 0.07,
            width: mediaQueryData.size.width,
            color: UtilConstants.primaryColor,
            child: Center(
              child: CustomText(
                "© 2023 BLOOMi. All rights reserved.",
                fontColor: UtilConstants.whiteColor,
                fontSize: mediaQueryData.size.height * 0.02,
                fontWeight: FontWeight.bold,
              ),
            )),
      ],
    );
  }
}
