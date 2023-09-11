import 'package:bloomi_web/components/costum_contact_icon.dart';
import 'package:bloomi_web/components/custom_image_cart.dart';
import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/screens/home/home/chat/chat.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:bloomi_web/utils/util_function.dart';
import 'package:flutter/material.dart';

class ContactCart extends StatelessWidget {
  const ContactCart({
    super.key,
    required this.mediaQueryData,
  });

  final MediaQueryData mediaQueryData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: (mediaQueryData.size.width >= 900)
              ? mediaQueryData.size.width * 0.2
              : mediaQueryData.size.width * 0.15,
          vertical: (mediaQueryData.size.width >= 900)
              ? mediaQueryData.size.height * 0.1
              : mediaQueryData.size.height * 0.1,
        ),
        child: Expanded(
            child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          width: mediaQueryData.size.width,
          height: (mediaQueryData.size.width >= 900) ? 420 : 460,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            gradient: LinearGradient(
              colors: [
                UtilConstants.primaryColor,
                UtilConstants.whiteColor,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              CustomImageCart(
                mediaQueryData: mediaQueryData,
                width: 180,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomText(
                "A counselor at the University of Peradeniya is a dedicated professional who provides guidance, support, and counseling services to students. They help students navigate academic, personal, and emotional challenges, empowering them to make informed decisions",
                fontSize: (mediaQueryData.size.width >= 900) ? 18 : 15,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w400,
                fontColor: UtilConstants.blackColor,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {},
                    child: CustomContactIcon(
                      "Email Me",
                      mediaQueryData: mediaQueryData,
                      icon: Icons.mark_email_read_outlined,
                      size: 50,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      UtilFunction.navigateForward(context, const Chat());
                    },
                    child: CustomContactIcon(
                      "Chat",
                      mediaQueryData: mediaQueryData,
                      icon: Icons.chat_rounded,
                      size: 48,
                    ),
                  ),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
