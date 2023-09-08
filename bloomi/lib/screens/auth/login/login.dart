import 'package:bloomi/components/custom_button.dart';
import 'package:bloomi/components/custom_text.dart';
import 'package:bloomi/components/custom_textfeild.dart';
import 'package:bloomi/components/customicon_container.dart';
import 'package:bloomi/screens/auth/forgotPassword/forgot_password.dart';
import 'package:bloomi/screens/auth/signup/sign_discription.dart';
import 'package:bloomi/screens/home/counsillerSelectPage/counsiller_select.dart';
import 'package:bloomi/utils/util_constant.dart';
import 'package:bloomi/utils/util_function.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: mediaQueryData.size.height * 0.02),
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
                      "Login",
                      fontSize: mediaQueryData.size.height * 0.04,
                      fontWeight: FontWeight.w600,
                    ),
                    Image.asset(
                      UtilConstants.counsellingImagePath,
                      width: mediaQueryData.size.height * 0.38,
                      height: mediaQueryData.size.height * 0.19,
                    ),
                    SizedBox(height: mediaQueryData.size.height * 0.04),
                    CustomTextFeild(
                      lable: "Enter your email",
                      mediaQueryData: mediaQueryData,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: mediaQueryData.size.height * 0.01),
                    CustomTextFeild(
                      lable: "Enter password",
                      obscure: true,
                      mediaQueryData: mediaQueryData,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    SizedBox(height: mediaQueryData.size.height * 0.01),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {
                          UtilFunction.navigateForward(
                              context, const ForgotPassword());
                        },
                        child: CustomText(
                          "forgot password?",
                          fontSize: mediaQueryData.size.height * 0.019,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: mediaQueryData.size.height * 0.07),
                    InkWell(
                      onTap: () {
                        UtilFunction.navigateForward(
                            context, const CounselorSelect());
                      },
                      child: CustomButton(
                        "Login",
                        mediaQueryData: mediaQueryData,
                        width: mediaQueryData.size.width,
                      ),
                    ),
                    SizedBox(height: mediaQueryData.size.height * 0.04),
                    CustomText(
                      "Or login with social account",
                      fontSize: mediaQueryData.size.height * 0.018,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: mediaQueryData.size.height * 0.025),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomIconContainer(
                          imgPath: UtilConstants.googleImagePath,
                          mediaQueryData: mediaQueryData,
                        ),
                        CustomIconContainer(
                          imgPath: UtilConstants.facebookImagePath,
                          mediaQueryData: mediaQueryData,
                        ),
                      ],
                    )
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
