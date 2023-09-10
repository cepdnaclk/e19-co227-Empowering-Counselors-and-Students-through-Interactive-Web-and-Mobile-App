import 'package:bloomi_web/components/background_color_gradient.dart';
import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/components/custom_text_link_mobile.dart';
import 'package:bloomi_web/components/customicon_container.dart';
import 'package:bloomi_web/components/footer.dart';
import 'package:bloomi_web/components/form_button_mobile.dart';
import 'package:bloomi_web/components/form_heading.dart';
import 'package:bloomi_web/components/form_input_mobile.dart';
import 'package:bloomi_web/providers/auth/login_provider.dart';
import 'package:bloomi_web/screens/auth/forgotPassword/forgot_password.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                                    FormHeading("Login Here",
                                        mediaQueryData: mediaQueryData),
                                    SizedBox(
                                        height:
                                            mediaQueryData.size.height * 0.08),
                                    FormInputMobile("Email",
                                        textEditingController:
                                            Provider.of<LoginProvider>(context)
                                                .email,
                                        mediaQueryData: mediaQueryData),
                                    SizedBox(
                                        height:
                                            mediaQueryData.size.height * 0.02),
                                    FormInputMobile("Password",
                                        textEditingController:
                                            Provider.of<LoginProvider>(context)
                                                .password,
                                        mediaQueryData: mediaQueryData),
                                    SizedBox(
                                        height:
                                            mediaQueryData.size.height * 0.05),
                                    Consumer<LoginProvider>(
                                      builder: (context, value, child) {
                                        return InkWell(
                                          onTap: () {
                                            value.signInUser(
                                                value.email.text,
                                                value.password.text,
                                                mediaQueryData,
                                                context);
                                          },
                                          child: FormButtonMobile(
                                            "Login",
                                            mediaQueryData: mediaQueryData,
                                          ),
                                        );
                                      },
                                    ),
                                    SizedBox(
                                        height:
                                            mediaQueryData.size.height * 0.02),
                                    CustomTextLinkMobile("Forgot Password?",
                                        mediaQueryData: mediaQueryData,
                                        widget: const ForgotPassword()),
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
