import 'package:bloomi/components/custom_button.dart';
import 'package:bloomi/components/custom_image.dart';
import 'package:bloomi/components/custom_text.dart';
import 'package:bloomi/utils/util_constant.dart';
import 'package:flutter/material.dart';

class SignUpDescription extends StatefulWidget {
  const SignUpDescription({super.key});

  @override
  State<SignUpDescription> createState() => _SignUpDescriptionState();
}

class _SignUpDescriptionState extends State<SignUpDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: CustomText(
                    "Join Bloomi",
                    fontColor: UtilConstants.blackColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Popins",
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 270,
                  width: 500,
                  decoration: BoxDecoration(
                      color: UtilConstants.lightBrownColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: const CustomImage(
                    imgPath: UtilConstants.counsellingImagePath,
                  ),
                ),
                const SizedBox(height: 20),
                const CustomText(
                  "Create an account to seamlessly connect with a Counsellor,Explore Bloomi for better student-counselor education connections",
                  fontSize: 20,
                  textAlign: TextAlign.left,
                  fontColor: UtilConstants.blackColor,
                ),
                const SizedBox(height: 20),
                const CustomButton(),
                const SizedBox(height: 220),
                const CustomText(
                  "Already have an account?",
                  fontColor: UtilConstants.primaryColor,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
