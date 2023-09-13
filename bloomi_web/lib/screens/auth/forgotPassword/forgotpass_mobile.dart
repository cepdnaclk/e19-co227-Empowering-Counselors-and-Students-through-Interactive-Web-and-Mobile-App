import 'package:bloomi_web/components/background_color_gradient.dart';
import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/components/form_button_mobile.dart';
import 'package:bloomi_web/components/form_heading.dart';
import 'package:bloomi_web/components/form_input_mobile.dart';
import 'package:bloomi_web/providers/auth/forgot_password_provider.dart';
import 'package:bloomi_web/screens/auth/login/login.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:bloomi_web/utils/util_function.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordMobile extends StatelessWidget {
  ForgotPasswordMobile({
    Key? key,
    required this.mediaQueryData,
  }) : super(key: key);

  final MediaQueryData mediaQueryData;
  final TextEditingController _email = TextEditingController();

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
                                  height: mediaQueryData.size.height * 0.2),
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
                                    FormHeading("Reset Password",
                                        mediaQueryData: mediaQueryData),
                                    SizedBox(
                                        height:
                                            mediaQueryData.size.height * 0.05),
                                    SizedBox(
                                      width: (mediaQueryData.size.width < 500)
                                          ? mediaQueryData.size.width
                                          : 400,
                                      child: CustomText(
                                        "Please, enter your email address. You will receive a link to create a new password via email.",
                                        fontSize:
                                            mediaQueryData.size.height * 0.018,
                                        fontWeight: FontWeight.w600,
                                        fontColor: UtilConstants.blackColor,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            mediaQueryData.size.height * 0.01),
                                    FormInputMobile("Email",
                                        textEditingController: _email,
                                        mediaQueryData: mediaQueryData),
                                    SizedBox(
                                        height:
                                            mediaQueryData.size.height * 0.07),
                                    Consumer<ForgotPasswordProvider>(
                                      builder: (context, value, child) {
                                        return InkWell(
                                          onTap: () {
                                            value
                                                .sendEmail(
                                                    context,
                                                    value.email.text,
                                                    mediaQueryData)
                                                .then((value) => UtilFunction
                                                    .navigateBackward(context,
                                                        const Login()));
                                          },
                                          child: FormButtonMobile(
                                            "Send",
                                            isLoading: value.isLoading,
                                            mediaQueryData: mediaQueryData,
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
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
        ],
      ),
    );
  }
}
