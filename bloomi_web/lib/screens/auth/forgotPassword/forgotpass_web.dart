import 'package:bloomi_web/components/background_color_gradient.dart';
import 'package:bloomi_web/components/custom_image_column.dart';
import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/components/footer.dart';
import 'package:bloomi_web/components/form_button_web.dart';
import 'package:bloomi_web/components/form_heading.dart';
import 'package:bloomi_web/components/form_input_web.dart';
import 'package:bloomi_web/screens/auth/login/login.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class ForgotPasswordWeb extends StatelessWidget {
  const ForgotPasswordWeb({
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
              Padding(
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
                                  top: mediaQueryData.size.height * 0.05),
                              decoration: BoxDecoration(
                                color: UtilConstants.lightgreyColor,
                                borderRadius: BorderRadius.circular(
                                    mediaQueryData.size.height * 0.03),
                              ),
                              child: Column(children: [
                                FormHeading("Reset Password",
                                    mediaQueryData: mediaQueryData),
                                SizedBox(
                                    height: mediaQueryData.size.height * 0.08),
                                SizedBox(
                                  width: mediaQueryData.size.width * 0.3,
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
                                    height: mediaQueryData.size.height * 0.01),
                                FormInputWeb("Email",
                                    mediaQueryData: mediaQueryData),
                                SizedBox(
                                    height: mediaQueryData.size.height * 0.06),
                                FormButtonWeb("Send",
                                    mediaQueryData: mediaQueryData,
                                    route: const Login()),
                              ]),
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
        ],
      ),
    );
  }
}
