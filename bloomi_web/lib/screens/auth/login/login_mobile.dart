import 'package:bloomi_web/components/background_color_gradient.dart';
import 'package:bloomi_web/components/custom_button.dart';
import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/components/custom_textfeild.dart';
import 'package:bloomi_web/components/customicon_container.dart';
import 'package:bloomi_web/components/footer.dart';
import 'package:bloomi_web/screens/auth/forgotPassword/forgot_password.dart';
import 'package:bloomi_web/screens/home/home/home.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:bloomi_web/utils/util_function.dart';
import 'package:flutter/material.dart';

class LoginMobile extends StatelessWidget {
  const LoginMobile({
    Key? key,
    required this.mediaQueryData,
  }) : super(key: key);

  final MediaQueryData mediaQueryData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                const BackgroundColorGradient(),
                SingleChildScrollView(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: mediaQueryData.size.width * 0.06),
                          child: Column(
                            children: [
                              SizedBox(
                                  height: mediaQueryData.size.height * 0.1),
                              Container(
                                padding: EdgeInsets.all(
                                    mediaQueryData.size.width * 0.04),
                                margin: EdgeInsets.only(
                                    top: mediaQueryData.size.height * 0.01),
                                decoration: BoxDecoration(
                                  color: UtilConstants.lightgreyColor,
                                  borderRadius: BorderRadius.circular(
                                      mediaQueryData.size.height * 0.03),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                        height:
                                            mediaQueryData.size.height * 0.08),
                                    SizedBox(
                                      width: mediaQueryData.size.width * 0.3,
                                      child: CustomText(
                                        "Login",
                                        fontSize:
                                            mediaQueryData.size.height * 0.04,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            mediaQueryData.size.height * 0.08),
                                    CustomTextFeild(
                                      hintText: "Enter your email",
                                      lable: "Email",
                                      mediaQueryData: mediaQueryData,
                                      keyboardType: TextInputType.emailAddress,
                                      width: (mediaQueryData.size.width < 500)
                                          ? mediaQueryData.size.width
                                          : 400,
                                    ),
                                    SizedBox(
                                        height:
                                            mediaQueryData.size.height * 0.02),
                                    CustomTextFeild(
                                      hintText: "Enter your password",
                                      lable: "Password",
                                      obscure: true,
                                      mediaQueryData: mediaQueryData,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      width: (mediaQueryData.size.width < 500)
                                          ? mediaQueryData.size.width
                                          : 400,
                                    ),
                                    SizedBox(
                                        height:
                                            mediaQueryData.size.height * 0.05),
                                    InkWell(
                                      onTap: () {
                                        UtilFunction.navigateForward(
                                            context, const Home());
                                      },
                                      child: CustomButton(
                                        "Login",
                                        mediaQueryData: mediaQueryData,
                                        width: (mediaQueryData.size.width < 500)
                                            ? mediaQueryData.size.width
                                            : 400,
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            mediaQueryData.size.height * 0.02),
                                    Container(
                                      width: (mediaQueryData.size.width < 500)
                                          ? mediaQueryData.size.width
                                          : 400,
                                      alignment: Alignment.centerRight,
                                      child: InkWell(
                                        onTap: () {
                                          UtilFunction.navigateForward(
                                              context, const ForgotPassword());
                                        },
                                        child: CustomText(
                                          "forgot password?",
                                          fontSize:
                                              mediaQueryData.size.height * 0.02,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            mediaQueryData.size.height * 0.04),
                                    CustomText(
                                      "Or login with social account",
                                      fontSize:
                                          mediaQueryData.size.height * 0.018,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    SizedBox(
                                        height:
                                            mediaQueryData.size.height * 0.025),
                                    SizedBox(
                                      width: (mediaQueryData.size.width < 500)
                                          ? mediaQueryData.size.width
                                          : 400,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          CustomIconContainer(
                                            imgPath:
                                                UtilConstants.googleImagePath,
                                            mediaQueryData: mediaQueryData,
                                          ),
                                          CustomIconContainer(
                                            imgPath:
                                                UtilConstants.facebookImagePath,
                                            mediaQueryData: mediaQueryData,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: mediaQueryData.size.height * 0.1,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Footer(mediaQueryData: mediaQueryData),
        ],
      ),
    );
  }
}
