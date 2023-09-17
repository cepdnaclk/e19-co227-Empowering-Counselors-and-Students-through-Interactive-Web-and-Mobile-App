import 'package:bloomi_web/components/admin_dropdown_menu.dart';
import 'package:bloomi_web/components/custom_image.dart';
import 'package:bloomi_web/components/form_button_web.dart';
import 'package:bloomi_web/components/form_heading.dart';
import 'package:bloomi_web/components/form_input_web.dart';
import 'package:bloomi_web/providers/auth/counselorregister_provider.dart';
import 'package:bloomi_web/utils/department_list.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Studentform extends StatefulWidget {
  const Studentform({
    Key? key, // Use Key? instead of super.key
  }) : super(key: key);

  @override
  State<Studentform> createState() => _CounselorformState();
}

class _CounselorformState extends State<Studentform> {
  List<String> faculty = [
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

  List<String> year = [
    '1st Year',
    '2nd Year',
    '3rd Year',
    '4th Year',
  ];

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      body: SingleChildScrollView(
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
                              "Update Student Details",
                            ),
                            SizedBox(height: mediaQueryData.size.height * 0.04),
                            FormInputWeb(
                              "Name",
                              textEditingController:
                                  Provider.of<CounselorRegistrationProvider>(
                                          context)
                                      .name,
                            ),
                            SizedBox(height: mediaQueryData.size.height * 0.01),
                            FormInputWeb(
                              "Email",
                              textEditingController:
                                  Provider.of<CounselorRegistrationProvider>(
                                          context)
                                      .email,
                            ),
                            FormInputWeb(
                              "Password",
                              textEditingController:
                                  Provider.of<CounselorRegistrationProvider>(
                                          context)
                                      .email,
                            ),
                            SizedBox(height: mediaQueryData.size.height * 0.01),
                            FormInputWeb(
                              "Phone Number",
                              textEditingController:
                                  Provider.of<CounselorRegistrationProvider>(
                                          context)
                                      .phoneNumber,
                            ),
                            SizedBox(height: mediaQueryData.size.height * 0.01),
                            SizedBox(
                              width: mediaQueryData.size.width * 0.3,
                              child: AdminDropDownButtonWidget(
                                  listItem: faculty, text: "Faculty"),
                            ),
                            SizedBox(height: mediaQueryData.size.height * 0.01),
                            SizedBox(
                              width: mediaQueryData.size.width * 0.3,
                              child: AdminDropDownButtonWidget(
                                  listItem: DepartmentList.facultyOfEngineering,
                                  text: "Department"),
                            ),
                            SizedBox(height: mediaQueryData.size.height * 0.01),
                            SizedBox(
                              width: mediaQueryData.size.width * 0.3,
                              child: AdminDropDownButtonWidget(
                                  listItem: year, text: "Year"),
                            ),
                            SizedBox(height: mediaQueryData.size.height * 0.03),
                            Consumer<CounselorRegistrationProvider>(
                              builder: (context, value, child) {
                                return InkWell(
                                  onTap: () {
                                    // Add your update logic here
                                  },
                                  child: const FormButtonWeb(
                                    "Update",
                                    isLoading: false,
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: mediaQueryData.size.height * 0.02),
                          ],
                        ),
                      ),
                    )
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
    );
  }
}
