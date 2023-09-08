import 'package:bloomi_web/components/custom_button.dart';
import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/components/custom_textfeild.dart';
import 'package:bloomi_web/components/customicon_container.dart';
import 'package:bloomi_web/components/footer.dart';
import 'package:bloomi_web/screens/auth/forgotPassword/forgot_password.dart';
import 'package:bloomi_web/screens/home/counsillerSelectPage/counsiller_select.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:bloomi_web/utils/util_function.dart';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: mediaQueryData.size.width * 0.1),
              child: Column(
                children: [
                  SizedBox(height: mediaQueryData.size.height * 0.1),
                  Row(
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            UtilConstants.counsellingImagePath,
                            width: mediaQueryData.size.width * 0.3,
                            height: mediaQueryData.size.height * 0.5,
                          ),
                        ],
                      ),
                      SizedBox(width: mediaQueryData.size.width * 0.14),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(
                                mediaQueryData.size.width * 0.03),
                            margin: EdgeInsets.only(
                                top: mediaQueryData.size.height * 0.05),
                            decoration: BoxDecoration(
                              color: UtilConstants.lightgreyColor,
                              borderRadius: BorderRadius.circular(
                                  mediaQueryData.size.height * 0.03),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                    height: mediaQueryData.size.height * 0.07),
                                CustomTextFeild(
                                  hintText: "Enter your email",
                                  lable: "Email",
                                  mediaQueryData: mediaQueryData,
                                  keyboardType: TextInputType.emailAddress,
                                  width: mediaQueryData.size.width * 0.3,
                                ),
                                SizedBox(
                                    height: mediaQueryData.size.height * 0.02),
                                CustomTextFeild(
                                  hintText: "Enter your password",
                                  lable: "Password",
                                  obscure: true,
                                  mediaQueryData: mediaQueryData,
                                  keyboardType: TextInputType.visiblePassword,
                                  width: mediaQueryData.size.width * 0.3,
                                ),
                                SizedBox(
                                    height: mediaQueryData.size.height * 0.04),
                                InkWell(
                                  onTap: () {
                                    UtilFunction.navigateForward(
                                        context, const CounselorSelect());
                                  },
                                  child: CustomButton(
                                    "Login",
                                    mediaQueryData: mediaQueryData,
                                    width: mediaQueryData.size.width * 0.3,
                                  ),
                                ),
                                SizedBox(
                                    height: mediaQueryData.size.height * 0.01),
                                Container(
                                  width: mediaQueryData.size.width * 0.3,
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                    onTap: () {
                                      UtilFunction.navigateForward(
                                          context, const ForgotPassword());
                                    },
                                    child: CustomText(
                                      "forgot password?",
                                      fontSize:
                                          mediaQueryData.size.height * 0.019,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    height: mediaQueryData.size.height * 0.07),
                                CustomText(
                                  "Or login with social account",
                                  fontSize: mediaQueryData.size.height * 0.018,
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(
                                    height: mediaQueryData.size.height * 0.025),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CustomIconContainer(
                                      imgPath: UtilConstants.googleImagePath,
                                      mediaQueryData: mediaQueryData,
                                    ),
                                    SizedBox(
                                        width:
                                            mediaQueryData.size.width * 0.04),
                                    CustomIconContainer(
                                      imgPath: UtilConstants.facebookImagePath,
                                      mediaQueryData: mediaQueryData,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Footer(mediaQueryData: mediaQueryData),
          ],
        ),
      ),
    );
  }
}
