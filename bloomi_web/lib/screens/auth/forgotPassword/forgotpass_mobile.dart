import 'package:bloomi_web/components/background_color_gradient.dart';
import 'package:bloomi_web/components/custom_button.dart';
import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/components/custom_textfeild.dart';
import 'package:bloomi_web/components/footer.dart';
import 'package:bloomi_web/screens/home/home/home.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:bloomi_web/utils/util_function.dart';
import 'package:flutter/material.dart';

class ForgotPasswordMobile extends StatelessWidget {
  const ForgotPasswordMobile({
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
                                  height: mediaQueryData.size.height * 0.15),
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
                                      width: (mediaQueryData.size.width < 500)
                                          ? mediaQueryData.size.width
                                          : 400,
                                      child: CustomText(
                                        "Forgot Password",
                                        fontSize:
                                            mediaQueryData.size.height * 0.03,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
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
                                            mediaQueryData.size.height * 0.07),
                                    InkWell(
                                      onTap: () {
                                        UtilFunction.navigateForward(
                                            context, const Home());
                                      },
                                      child: CustomButton(
                                        "Send",
                                        mediaQueryData: mediaQueryData,
                                        width: (mediaQueryData.size.width < 500)
                                            ? mediaQueryData.size.width
                                            : 400,
                                      ),
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
          Footer(mediaQueryData: mediaQueryData),
        ],
      ),
    );
  }
}
