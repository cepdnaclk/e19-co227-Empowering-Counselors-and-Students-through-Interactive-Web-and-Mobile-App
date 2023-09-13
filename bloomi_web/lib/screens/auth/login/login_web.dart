import 'package:bloomi_web/components/background_color_gradient.dart';
import 'package:bloomi_web/components/custom_image_column.dart';
import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/components/custom_text_link_web.dart';
import 'package:bloomi_web/components/customicon_container.dart';
import 'package:bloomi_web/components/form_button_web.dart';
import 'package:bloomi_web/components/form_heading.dart';
import 'package:bloomi_web/components/form_input_web.dart';
import 'package:bloomi_web/providers/auth/login_provider.dart';
import 'package:bloomi_web/screens/auth/forgotPassword/forgot_password.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginWeb extends StatelessWidget {
  const LoginWeb({
    super.key,
    required this.mediaQueryData,
  });

  final MediaQueryData mediaQueryData;

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
                                          textEditingController:
                                              Provider.of<LoginProvider>(
                                                      context)
                                                  .email,
                                          mediaQueryData: mediaQueryData),
                                      SizedBox(
                                          height: mediaQueryData.size.height *
                                              0.02),
                                      FormInputWeb("Password",
                                          textEditingController:
                                              Provider.of<LoginProvider>(
                                                      context)
                                                  .password,
                                          mediaQueryData: mediaQueryData),
                                      SizedBox(
                                          height: mediaQueryData.size.height *
                                              0.04),
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
                                            child: FormButtonWeb(
                                              "Login",
                                              isLoading: value.isLoading,
                                              mediaQueryData: mediaQueryData,
                                            ),
                                          );
                                        },
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
            ],
          ),
        ],
      ),
    );
  }
}
