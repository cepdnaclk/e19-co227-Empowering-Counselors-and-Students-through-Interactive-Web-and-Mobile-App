import 'package:bloomi/components/custom_button.dart';
import 'package:bloomi/components/custom_text.dart';
import 'package:bloomi/components/custom_textfeild.dart';
import 'package:bloomi/screens/auth/signup/sign_discription.dart';
import 'package:bloomi/utils/util_constant.dart';
import 'package:bloomi/utils/util_function.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: mediaQueryData.size.height * 0.019),
            child: Column(
              children: [
                SizedBox(height: mediaQueryData.size.height * 0.01),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: InkWell(
                    onTap: () {
                      UtilFunction.navigateBackward(
                          context, const SignUpDescription());
                    },
                    child: const Icon(Icons.arrow_back_ios_new_outlined),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: mediaQueryData.size.height * 0.05),
                    CustomText(
                      "Forgot Password",
                      fontSize: mediaQueryData.size.height * 0.04,
                      fontWeight: FontWeight.w600,
                    ),
                    Image.asset(
                      UtilConstants.counsellingImagePath,
                      width: mediaQueryData.size.height * 0.38,
                      height: mediaQueryData.size.height * 0.19,
                    ),
                    SizedBox(height: mediaQueryData.size.height * 0.05),
                    CustomText(
                      "Please, enter your email address. You will receive a link to create a new password via email.",
                      fontSize: mediaQueryData.size.height * 0.018,
                      fontWeight: FontWeight.w600,
                      fontColor: UtilConstants.blackColor,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: mediaQueryData.size.height * 0.019),
                    CustomTextFeild(
                      lable: "Enter your email",
                      mediaQueryData: mediaQueryData,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: mediaQueryData.size.height * 0.07),
                    CustomButton("Send",
                        mediaQueryData: mediaQueryData,
                        width: mediaQueryData.size.width),
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
