import 'package:bloomi_web/components/background_color_gradient.dart';
import 'package:bloomi_web/components/custom_image_column.dart';
import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/components/custom_text_link_web.dart';
import 'package:bloomi_web/components/customicon_container.dart';
import 'package:bloomi_web/components/footer.dart';
import 'package:bloomi_web/components/form_button_web.dart';
import 'package:bloomi_web/components/form_heading.dart';
import 'package:bloomi_web/components/form_input_web.dart';
import 'package:bloomi_web/screens/auth/forgotPassword/forgot_password.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class LoginWeb extends StatelessWidget {
  LoginWeb({
    super.key,
    required this.mediaQueryData,
  });

  final MediaQueryData mediaQueryData;
  final TextEditingController _password = TextEditingController();
  final TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          const BackgroundColorGradient(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: mediaQueryData.size.width * 0.1),
                    child: Column(
                      children: [
                        SizedBox(height: mediaQueryData.size.height * 0.1),
                        Row(
                          children: [
                            CustomImageColumn(mediaQueryData: mediaQueryData),
                            SizedBox(width: mediaQueryData.size.width * 0.12),
                            Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(
                                      mediaQueryData.size.width * 0.03),
                                  margin: EdgeInsets.only(
                                      top: mediaQueryData.size.height * 0.03),
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
                                          height: mediaQueryData.size.height *
                                              0.06),
                                      FormInputWeb("Email",
                                          textEditingController: _email,
                                          mediaQueryData: mediaQueryData),
                                      SizedBox(
                                          height: mediaQueryData.size.height *
                                              0.02),
                                      FormInputWeb("Password",
                                          textEditingController: _password,
                                          mediaQueryData: mediaQueryData),
                                      SizedBox(
                                          height: mediaQueryData.size.height *
                                              0.04),
                                      FormButtonWeb(
                                        "Login",
                                        mediaQueryData: mediaQueryData,
                                      ),
                                      SizedBox(
                                          height: mediaQueryData.size.height *
                                              0.01),
                                      CustomTextLinkWeb("forgot password?",
                                          mediaQueryData: mediaQueryData,
                                          route: const ForgotPassword()),
                                      SizedBox(
                                          height: mediaQueryData.size.height *
                                              0.05),
                                      CustomText(
                                        "Or login with social account",
                                        fontSize:
                                            mediaQueryData.size.height * 0.018,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      SizedBox(
                                          height: mediaQueryData.size.height *
                                              0.02),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          CustomIconContainer(
                                            imgPath:
                                                UtilConstants.googleImagePath,
                                            mediaQueryData: mediaQueryData,
                                          ),
                                          SizedBox(
                                              width: mediaQueryData.size.width *
                                                  0.04),
                                          CustomIconContainer(
                                            imgPath:
                                                UtilConstants.facebookImagePath,
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
                        SizedBox(
                          height: mediaQueryData.size.height * 0.1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Footer(mediaQueryData: mediaQueryData),
            ],
          ),
        ],
      ),
    );
  }
}
