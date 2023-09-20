import 'package:bloomi_web/components/dropdown_button.dart';
import 'package:bloomi_web/components/form_button_web.dart';
import 'package:bloomi_web/components/form_heading.dart';
import 'package:bloomi_web/components/form_input_web.dart';
import 'package:bloomi_web/providers/admin/counselor_registration_provider.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditTablet extends StatefulWidget {
  const EditTablet({
    super.key,
  });

  @override
  State<EditTablet> createState() => _EditTabletState();
}

class _EditTabletState extends State<EditTablet> {
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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 10),
              Container(
                height: 580,
                width: 420,
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
                      height: UtilConstants.spaceBetweenHeadingAndInputTablet,
                    ),
                    FormInputWeb(
                      "Name",
                      textEditingController:
                          Provider.of<CounselorRegistrationProvider>(context)
                              .name,
                    ),
                    const SizedBox(height: 10),
                    FormInputWeb(
                      "Email",
                      textEditingController:
                          Provider.of<CounselorRegistrationProvider>(context)
                              .email,
                    ),
                    const SizedBox(height: 10),
                    FormInputWeb(
                      "Password",
                      textEditingController:
                          Provider.of<CounselorRegistrationProvider>(context)
                              .password,
                      obscure: true,
                    ),
                    const SizedBox(height: 10),
                    FormInputWeb(
                      "Phone Number",
                      textEditingController:
                          Provider.of<CounselorRegistrationProvider>(context)
                              .phoneNumber,
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 420,
                      child: DropDownButtonWidget(
                          index: 1, listItem: faculty, text: "Faculty"),
                    ),
                    const SizedBox(height: 10),
                    FormInputWeb(
                      "Credentials",
                      textEditingController:
                          Provider.of<CounselorRegistrationProvider>(context)
                              .credentials,
                    ),
                    const SizedBox(height: 25),
                    Consumer<CounselorRegistrationProvider>(
                      builder: (context, value, child) {
                        return InkWell(
                          onTap: () {
                            value.signUpUser(
                                value.name.text,
                                value.email.text,
                                value.password.text,
                                value.phoneNumber.text,
                                value.faculty,
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
                  ],
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}
