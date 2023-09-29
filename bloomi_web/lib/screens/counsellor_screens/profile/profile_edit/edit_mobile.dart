import 'package:bloomi_web/components/dropdown_button.dart';
import 'package:bloomi_web/components/form_button_web.dart';
import 'package:bloomi_web/components/form_heading.dart';
import 'package:bloomi_web/components/form_input_web.dart';
import 'package:bloomi_web/providers/admin/counselor_registration_provider.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditMobile extends StatefulWidget {
  const EditMobile({
    super.key,
  });

  @override
  State<EditMobile> createState() => _EditMobileState();
}

class _EditMobileState extends State<EditMobile> {
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Center(
      child: SingleChildScrollView(
        child: Container(
          height: height * 0.8,
          width: width * 0.8,
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
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
                height: UtilConstants.spaceBetweenHeadingAndInputMobile,
              ),
              FormInputWeb(
                "Name",
                textEditingController:
                    Provider.of<CounsellorRegistrationProvider>(context).name,
                fontSize: 12,
                height: 45,
                width: 280,
                lableFontSize: 12,
              ),
              const SizedBox(height: 6),
              FormInputWeb(
                "Email",
                textEditingController:
                    Provider.of<CounsellorRegistrationProvider>(context).email,
                fontSize: 12,
                height: 45,
                width: 280,
                lableFontSize: 12,
              ),
              const SizedBox(height: 6),
              Consumer<CounsellorRegistrationProvider>(
                builder: (context, value, child) {
                  return FormInputWeb(
                    "Password",
                    textEditingController: value.password,
                    fontSize: 12,
                    height: 45,
                    width: 280,
                    lableFontSize: 12,
                    obscure: value.isObscure ? true : false,
                    icon: InkWell(
                      onTap: () {
                        value.setIsObscure(false);
                      },
                      child: value.isObscure
                          ? const Icon(Icons.visibility_off, size: 15)
                          : const Icon(Icons.visibility, size: 15),
                    ),
                  );
                },
              ),
              const SizedBox(height: 6),
              FormInputWeb(
                "Phone Number",
                textEditingController:
                    Provider.of<CounsellorRegistrationProvider>(context)
                        .phoneNumber,
                fontSize: 12,
                height: 45,
                width: 280,
                lableFontSize: 12,
              ),
              const SizedBox(height: 6),
              SizedBox(
                width: 280,
                child: DropDownButtonWidget(
                  index: 1,
                  listItem: faculty,
                  text: "Faculty",
                ),
              ),
              const SizedBox(height: 6),
              FormInputWeb(
                "Credentials",
                textEditingController:
                    Provider.of<CounsellorRegistrationProvider>(context)
                        .credentials,
                fontSize: 12,
                height: 45,
                width: 280,
                lableFontSize: 12,
              ),
              const SizedBox(height: 25),
              Consumer<CounsellorRegistrationProvider>(
                builder: (context, value, child) {
                  return InkWell(
                    onTap: () {
                      value.updateCounselor(
                        value.name.text,
                        value.email.text,
                        value.password.text,
                        value.phoneNumber.text,
                        value.faculty,
                        value.credentials.text,
                        context,
                        value.counsellorModel!.imgUrl,
                        value.counsellorModel!.uid,
                      );
                    },
                    child: FormButtonWeb(
                      "Save",
                      isLoading: value.isLoading,
                      width: 280,
                      height: 45,
                      fontSize: 12,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
