import 'package:bloomi_web/components/costum_contact_icon.dart';
import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class ContactCart extends StatelessWidget {
  const ContactCart({
    super.key,
    required this.mediaQueryData,
    required this.name,
    required this.fac,
    required this.email,
    required this.phone,
  });

  final String name;
  final String fac;
  final String email;
  final String phone;
  final MediaQueryData mediaQueryData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mediaQueryData.size.width * 0.6,
      height: mediaQueryData.size.height * 0.6,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            UtilConstants.primaryColor,
            UtilConstants.whiteColor
          ], // Define your gradient colors
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: (mediaQueryData.size.width >= 900)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: mediaQueryData.size.width * 0.5,
                  height: mediaQueryData.size.height * 0.3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: mediaQueryData.size.width * 0.1,
                        height: mediaQueryData.size.width * 0.1,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            UtilConstants.profImagePath,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      CustomText(
                          "Name : $name\nFaculty : $fac\nUniversity : University of Peradeniya\nPhone : $phone",
                          fontSize: mediaQueryData.size.width * 0.014,
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.w600,
                          fontColor: UtilConstants.blackColor),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: mediaQueryData.size.width * 0.08),
                  child: SizedBox(
                      width: mediaQueryData.size.width * 0.5,
                      height: mediaQueryData.size.height * 0.1,
                      child: CustomText(
                          "DESCRIPTION : A counselor at the University of Peradeniya is a dedicated professional who provides guidance, support, and counseling services to students. They help students navigate academic, personal, and emotional challenges, empowering them to make informed decisions ",
                          fontSize: mediaQueryData.size.width * 0.01,
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.w400,
                          fontColor: UtilConstants.blackColor)),
                ),
                SizedBox(
                  width: mediaQueryData.size.width * 0.5,
                  height: mediaQueryData.size.height * 0.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomContactIcon("Email Me",
                          mediaQueryData: mediaQueryData,
                          icon: Icons.mark_email_read_outlined),
                      CustomContactIcon(
                        "Chat",
                        mediaQueryData: mediaQueryData,
                        icon: Icons.chat_rounded,
                        size: 0.045,
                      )
                    ],
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: mediaQueryData.size.width * 0.5,
                  height: mediaQueryData.size.height * 0.3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: mediaQueryData.size.width * 0.13,
                        height: mediaQueryData.size.width * 0.13,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            UtilConstants.profImagePath,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      CustomText(
                          "Name : $name\nFaculty : $fac\nUniversity : University of Peradeniya\nPhone : $phone",
                          fontSize: mediaQueryData.size.width * 0.018,
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.w600,
                          fontColor: UtilConstants.blackColor),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: mediaQueryData.size.width * 0.08),
                  child: SizedBox(
                      width: mediaQueryData.size.width * 0.5,
                      height: mediaQueryData.size.height * 0.14,
                      child: CustomText(
                          "DESCRIPTION : A counselor at the University of Peradeniya is a dedicated professional who provides guidance, support, and counseling services to students. They help students navigate academic, personal, and emotional challenges, empowering them to make informed decisions",
                          fontSize: mediaQueryData.size.width * 0.016,
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.w400,
                          fontColor: UtilConstants.blackColor)),
                ),
                SizedBox(
                  width: mediaQueryData.size.width * 0.5,
                  height: mediaQueryData.size.height * 0.16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomContactIcon(
                        "Email Me",
                        mediaQueryData: mediaQueryData,
                        icon: Icons.mark_email_read_outlined,
                        size: 0.075,
                      ),
                      CustomContactIcon(
                        "Chat",
                        mediaQueryData: mediaQueryData,
                        icon: Icons.chat_rounded,
                        size: 0.07,
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
