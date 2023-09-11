import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Column(
      children: [
        SizedBox(height: mediaQueryData.size.height * 0.07),
        SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: UtilConstants.primaryColor,
                size: 40,
              ),
              Container(
                width: mediaQueryData.size.width * 0.6,
                height: mediaQueryData.size.height * 0.6,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      UtilConstants.whiteColor,
                      Colors.blue
                    ], // Define your gradient colors
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
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
                              color: Colors.blue,
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                UtilConstants.profImagePath,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          CustomText(
                              "Name : Sachith Dissanayaka\nFaculty : Faculty of Engineering\nUniversity : University of Peradeniya\nEmail :sachithdissanayaka135@gmail.com\nPhone : +9471 123 4567",
                              fontSize: mediaQueryData.size.width * 0.014,
                              textAlign: TextAlign.left,
                              fontWeight: FontWeight.w700,
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
                              "DESCRIPTION : A counselor at the University of Peradeniya is a dedicated professional who provides guidance, support, and counseling services to students. They help students navigate academic, personal, and emotional challenges, empowering them to make informed decisions and succeed in their university journey",
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
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.mark_email_read_outlined,
                                color: UtilConstants.primaryColor,
                                size: mediaQueryData.size.width * 0.05,
                              ),
                              CustomText("Email Me",
                                  fontSize: mediaQueryData.size.width * 0.01,
                                  textAlign: TextAlign.left,
                                  fontWeight: FontWeight.w700,
                                  fontColor: UtilConstants.blackColor),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.message_outlined,
                                color: UtilConstants.primaryColor,
                                size: mediaQueryData.size.width * 0.045,
                              ),
                              CustomText("Massage Me",
                                  fontSize: mediaQueryData.size.width * 0.01,
                                  textAlign: TextAlign.left,
                                  fontWeight: FontWeight.w700,
                                  fontColor: UtilConstants.blackColor),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: UtilConstants.primaryColor,
                size: 40,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
