// Admin Register Form
import 'package:bloomi_web/components/dropdown_button.dart';
import 'package:bloomi_web/components/form_button_web.dart';
import 'package:bloomi_web/components/form_heading.dart';
import 'package:bloomi_web/components/form_input_web.dart';
import 'package:bloomi_web/providers/admin/counselor_registration_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

class CounselorForm {
  static counselorregistrationform(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        double heightone = MediaQuery.of(context).size.height;
        return Center(
          child: Container(
            width: 500,
            height: 1000,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.0),
            ),
            child: AlertDialog(
              actions: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Center(
                    child: FormHeading(
                      "Add Counselor",
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(height: heightone * 0.04),
                FormInputWeb(
                  "Name",
                  textEditingController:
                      Provider.of<CounsellorRegistrationProvider>(context).name,
                ),
                SizedBox(height: heightone * 0.01),
                FormInputWeb(
                  "Email",
                  textEditingController:
                      Provider.of<CounsellorRegistrationProvider>(context)
                          .email,
                ),
                SizedBox(height: heightone * 0.01),
                FormInputWeb(
                  "Password",
                  obscure: true,
                  textEditingController:
                      Provider.of<CounsellorRegistrationProvider>(context)
                          .password,
                ),
                SizedBox(height: heightone * 0.01),
                FormInputWeb(
                  "Phone Number",
                  textEditingController:
                      Provider.of<CounsellorRegistrationProvider>(context)
                          .phoneNumber,
                ),
                SizedBox(height: heightone * 0.01),
                SizedBox(
                    width: 420,
                    child: DropDownButtonWidget(
                        listItem: faculty,
                        text: "Faculty",
                        index: 1,
                        isFormAdmin: true)),
                SizedBox(height: heightone * 0.01),
                FormInputWeb(
                  "Credentials",
                  textEditingController:
                      Provider.of<CounsellorRegistrationProvider>(context)
                          .credentials,
                ),
                SizedBox(height: heightone * 0.01),
                SizedBox(height: heightone * 0.01),
                SizedBox(height: heightone * 0.01),
                Consumer<CounsellorRegistrationProvider>(
                  builder: (context, value, child) {
                    return InkWell(
                      onTap: () {
                        value.signUpCounsellor(
                            value.name.text,
                            value.email.text,
                            value.password.text,
                            value.phoneNumber.text,
                            value.faculty,
                            value.credentials.text,
                            context);
                      },
                      child: FormButtonWeb(
                        "Register",
                        isLoading: value.isLoading,
                      ),
                    );
                  },
                ),
                SizedBox(height: heightone * 0.02),
              ],
            ),
          ),
        );
      },
    );
  }
}
