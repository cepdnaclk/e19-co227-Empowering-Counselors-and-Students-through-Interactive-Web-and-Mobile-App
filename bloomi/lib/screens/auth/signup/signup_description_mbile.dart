import 'package:bloomi/components/custom_button.dart';
import 'package:bloomi/components/custom_image.dart';
import 'package:bloomi/components/custom_text.dart';
import 'package:bloomi/screens/auth/login/login.dart';
import 'package:bloomi/screens/auth/signup/signup_form.dart';
import 'package:bloomi/utils/util_constant.dart';
import 'package:bloomi/utils/util_function.dart';
import 'package:flutter/material.dart';

class SignUpDiscriptionMobile extends StatelessWidget {
  const SignUpDiscriptionMobile({
    super.key,
    required this.mediaQueryData,
  });

  final MediaQueryData mediaQueryData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: mediaQueryData.size.width * 0.025,
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: mediaQueryData.size.height * 0.05),
              Container(
                height: mediaQueryData.size.height * 0.3,
                width: mediaQueryData.size.width * 0.85,
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
              SizedBox(height: mediaQueryData.size.height * 0.025),
              SizedBox(
                width: mediaQueryData.size.width * 0.85,
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
                child: CustomButton("Get Started",
                    mediaQueryData: mediaQueryData,
                    width: mediaQueryData.size.width * 0.85),
              ),
              SizedBox(height: mediaQueryData.size.height * 0.3),
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
        ),
      ),
    );
  }
}
