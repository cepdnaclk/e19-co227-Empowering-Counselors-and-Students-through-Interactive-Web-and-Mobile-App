import 'package:bloomi/components/custom_button.dart';
import 'package:bloomi/components/custom_text.dart';
import 'package:bloomi/components/custom_textfeild.dart';
import 'package:bloomi/screens/auth/signup/sign_discription.dart';
import 'package:bloomi/utils/util_constant.dart';
import 'package:bloomi/utils/util_function.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: mediaQueryData.size.height * 0.02),
            child: Column(
              children: [
                SizedBox(height: mediaQueryData.size.height * 0.05),
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
                SizedBox(height: mediaQueryData.size.height * 0.05),
                CustomText(
                  "SignUp",
                  fontSize: mediaQueryData.size.height * 0.04,
                  fontWeight: FontWeight.w600,
                ),
                Image.asset(
                  UtilConstants.counsellingImagePath,
                  width: mediaQueryData.size.height * 0.38,
                  height: mediaQueryData.size.height * 0.19,
                ),
                SizedBox(height: mediaQueryData.size.height * 0.08),
                CustomTextFeild(
                  lable: "Enter your full name",
                  mediaQueryData: mediaQueryData,
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: mediaQueryData.size.height * 0.02),
                CustomTextFeild(
                  lable: "Enter your email",
                  mediaQueryData: mediaQueryData,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: mediaQueryData.size.height * 0.02),
                CustomTextFeild(
                  lable: "Create password",
                  obscure: true,
                  mediaQueryData: mediaQueryData,
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(height: mediaQueryData.size.height * 0.02),
                CustomTextFeild(
                  lable: "Confirm password",
                  obscure: true,
                  mediaQueryData: mediaQueryData,
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(height: mediaQueryData.size.height * 0.10),
                CustomButton(
                  "Register",
                  mediaQueryData: mediaQueryData,
                  width: mediaQueryData.size.width * 0.4,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
