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
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
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
                const SizedBox(height: 92),
                const CustomText(
                  "Forgot Password",
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
                Image.asset(
                  UtilConstants.counsellingImagePath,
                  width: 300,
                  height: 150,
                ),
                const SizedBox(height: 100),
                const CustomText(
                  "Please, enter your email address. You will receive a link to create a new password via email.",
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontColor: UtilConstants.blackColor,
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 16),
                const CustomTextFeild(
                  lable: "Enter your email",
                ),
                const SizedBox(height: 53),
                const CustomButton("Send"),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
