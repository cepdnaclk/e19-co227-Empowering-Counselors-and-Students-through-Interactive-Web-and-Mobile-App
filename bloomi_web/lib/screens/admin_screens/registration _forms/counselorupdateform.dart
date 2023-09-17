import 'package:bloomi_web/components/custom_image.dart';
import 'package:bloomi_web/components/dropdown_button.dart';
import 'package:bloomi_web/components/form_button_web.dart';
import 'package:bloomi_web/components/form_heading.dart';
import 'package:bloomi_web/components/form_input_web.dart';
import 'package:bloomi_web/providers/auth/counselorregister_provider.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counselorupdateform extends StatefulWidget {
  const Counselorupdateform({
    super.key,
  });

  @override
  State<Counselorupdateform> createState() => _CounselorformState();
}

class _CounselorformState extends State<Counselorupdateform> {
  List<String> listItems = [
    'Faculty of Engineering',
    'Faculty of Medicine',
    'Faculty of Dental Sciences',
    'Faculty of Veterinary Medicine and Animal Science',
    'Faculty of Science',
    'Faculty of Agriculture',
    'Faculty of Allied Health Sciences',
    'Faculty of Arts',
    'Faculty of Management',
  ];

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 200),
            child: Center(
              child: Row(
                children: [
                  const CustomImage(
                    width: 200,
                    height: 200,
                    imgPath: UtilConstants.registerImagePath,
                  ),
                  SizedBox(width: mediaQueryData.size.width * 0.05),
                  SizedBox(height: mediaQueryData.size.height * 0.02),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(30),
                        margin: EdgeInsets.only(
                            top: mediaQueryData.size.height * 0.02),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              const FormHeading(
                                "Update Counselor Details",
                              ),
                              SizedBox(
                                  height: mediaQueryData.size.height * 0.04),
                              FormInputWeb(
                                "Name",
                                textEditingController:
                                    Provider.of<CounselorRegistrationProvider>(
                                            context)
                                        .name,
                              ),
                              SizedBox(
                                  height: mediaQueryData.size.height * 0.01),
                              FormInputWeb(
                                "Email",
                                textEditingController:
                                    Provider.of<CounselorRegistrationProvider>(
                                            context)
                                        .email,
                              ),
                              SizedBox(
                                  height: mediaQueryData.size.height * 0.01),
                              FormInputWeb(
                                "Phone Number",
                                textEditingController:
                                    Provider.of<CounselorRegistrationProvider>(
                                            context)
                                        .phoneNumber,
                              ),
                              SizedBox(
                                  height: mediaQueryData.size.height * 0.01),
                              CustomDropdownMenu(
                                "Faculty",
                                listItem: listItems,
                                textEditingController:
                                    Provider.of<CounselorRegistrationProvider>(
                                            context)
                                        .faculty,
                              ),
                              SizedBox(
                                  height: mediaQueryData.size.height * 0.01),
                              FormInputWeb(
                                "Credentials",
                                textEditingController:
                                    Provider.of<CounselorRegistrationProvider>(
                                            context)
                                        .credentials,
                              ),
                              SizedBox(
                                  height: mediaQueryData.size.height * 0.01),
                              SizedBox(
                                  height: mediaQueryData.size.height * 0.01),
                              SizedBox(
                                  height: mediaQueryData.size.height * 0.01),
                              Consumer<CounselorRegistrationProvider>(
                                builder: (context, value, child) {
                                  return InkWell(
                                    onTap: () {},
                                    child: const FormButtonWeb(
                                      "Update",
                                      isLoading: false,
                                    ),
                                  );
                                },
                              ),
                              SizedBox(
                                  height: mediaQueryData.size.height * 0.02),
                            ],
                          ),
                        ),
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
      ),
    );
  }
}
