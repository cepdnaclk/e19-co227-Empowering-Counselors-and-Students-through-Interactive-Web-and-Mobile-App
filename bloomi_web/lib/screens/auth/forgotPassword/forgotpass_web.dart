import 'package:bloomi_web/components/background_color_gradient.dart';
import 'package:bloomi_web/components/custom_button.dart';
import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/components/custom_textfeild.dart';
import 'package:bloomi_web/components/footer.dart';
import 'package:bloomi_web/screens/home/home/home.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:bloomi_web/utils/util_function.dart';
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
                              child: Column(children: [
                                SizedBox(
                                    height: mediaQueryData.size.height * 0.03),
                                SizedBox(
                                  width: mediaQueryData.size.width * 0.3,
                                  child: CustomText(
                                    "Forgot Password",
                                    fontSize: mediaQueryData.size.height * 0.04,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
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
                                CustomTextFeild(
                                  hintText: "Enter your email",
                                  lable: "Email",
                                  mediaQueryData: mediaQueryData,
                                  keyboardType: TextInputType.emailAddress,
                                  width: mediaQueryData.size.width * 0.3,
                                ),
                                SizedBox(
                                    height: mediaQueryData.size.height * 0.06),
                                InkWell(
                                  onTap: () {
                                    UtilFunction.navigateForward(
                                        context, const Home());
                                  },
                                  child: CustomButton(
                                    "Send",
                                    mediaQueryData: mediaQueryData,
                                    width: mediaQueryData.size.width * 0.3,
                                  ),
                                ),
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
