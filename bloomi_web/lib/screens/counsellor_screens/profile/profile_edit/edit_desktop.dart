import 'package:bloomi_web/components/custom_image_column.dart';
import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/components/custom_text_link_web.dart';
import 'package:bloomi_web/components/form_button_web.dart';
import 'package:bloomi_web/components/form_heading.dart';
import 'package:bloomi_web/components/form_input_web.dart';
import 'package:bloomi_web/providers/counselor/counselorprofile_edit_provider.dart';
import 'package:bloomi_web/screens/auth_screens/login/login.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class editDesktop extends StatefulWidget {
  const editDesktop({
    super.key,
  });

  @override
  State<editDesktop> createState() => _editDesktopState();
}

class _editDesktopState extends State<editDesktop> {
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
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(width: 10),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImageColumn(),
                SizedBox(
                  width: 420,
                  child: CustomText("BLOOMi ",
                      fontColor: UtilConstants.primaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
            const SizedBox(width: 20),
            SingleChildScrollView(
              child: Container(
                //height: 580,
                width: 460,
                padding: const EdgeInsets.only(
                    left: 40, right: 40, top: 30, bottom: 10),
                decoration: BoxDecoration(
                  color: UtilConstants.lightgreyColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    const FormHeading(
                      "Edit your Profile",
                    ),
                    const SizedBox(
                      height: UtilConstants.spaceBetweenHeadingAndInputDesktop,
                    ),
                    FormInputWeb(
                      "Name",
                      textEditingController:
                          Provider.of<CounselorProfileEditProvider>(context)
                              .name,
                    ),
                    const SizedBox(height: 10),
                    FormInputWeb(
                      "Email",
                      textEditingController:
                          Provider.of<CounselorProfileEditProvider>(context)
                              .email,
                    ),
                    const SizedBox(height: 10),
                    FormInputWeb(
                      "Password",
                      textEditingController:
                          Provider.of<CounselorProfileEditProvider>(context)
                              .password,
                      obscure: true,
                    ),
                    const SizedBox(height: 10),
                    FormInputWeb(
                      "Password",
                      textEditingController:
                          Provider.of<CounselorProfileEditProvider>(context)
                              .confirmPassword,
                      obscure: true,
                    ),
                    const SizedBox(height: 10),
                    FormInputWeb(
                      "Phone Number",
                      textEditingController:
                          Provider.of<CounselorProfileEditProvider>(context)
                              .phoneNumber,
                    ),
                    const SizedBox(height: 10),
                    FormInputWeb(
                      "Faculty",
                      textEditingController:
                          Provider.of<CounselorProfileEditProvider>(context)
                              .faculty,
                    ),
                    const SizedBox(height: 10),
                    FormInputWeb("Department",
                        textEditingController:
                            Provider.of<CounselorProfileEditProvider>(context)
                                .department),
                    const SizedBox(height: 10),
                    FormInputWeb(
                      "Credentials",
                      textEditingController:
                          Provider.of<CounselorProfileEditProvider>(context)
                              .credentials,
                    ),
                    const SizedBox(height: 25),
                    Consumer<CounselorProfileEditProvider>(
                      builder: (context, value, child) {
                        return InkWell(
                          onTap: () {
                            Provider.of<CounselorProfileEditProvider>(context,
                                    listen: false)
                                .counselorProfileEdit(
                                    value.email.text,
                                    value.password.text,
                                    value.confirmPassword.text,
                                    value.name.text,
                                    value.phoneNumber.text,
                                    value.department.text,
                                    value.faculty.text,
                                    value.credentials.text,
                                    context);
                          },
                          child: FormButtonWeb(
                            "Save",
                            isLoading: value.isLoading,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 6),
                    const CustomTextLinkWeb("Import Profile Image",
                        route: Login())
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
