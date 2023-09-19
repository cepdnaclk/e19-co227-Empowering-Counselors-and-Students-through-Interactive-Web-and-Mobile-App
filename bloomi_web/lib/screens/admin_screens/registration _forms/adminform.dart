import 'package:bloomi_web/components/form_button_web.dart';
import 'package:bloomi_web/components/form_heading.dart';
import 'package:bloomi_web/components/form_input_web.dart';
import 'package:bloomi_web/providers/admin/admin_registration_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminRegistrationForm extends StatelessWidget {
  const AdminRegistrationForm({super.key});

  @override
  Widget build(BuildContext context) {
    double heightone = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 440,
            height: 600,
            padding: const EdgeInsets.all(30),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Center(
              child: Column(
                children: [
                  const FormHeading(
                    "Add Admins",
                  ),
                  SizedBox(height: heightone * 0.04),
                  FormInputWeb(
                    "Name",
                    textEditingController:
                        Provider.of<AdminRegistrationProvider>(context).name,
                  ),
                  SizedBox(height: heightone * 0.01),
                  FormInputWeb(
                    "Email",
                    textEditingController:
                        Provider.of<AdminRegistrationProvider>(context).email,
                  ),
                  SizedBox(height: heightone * 0.01),
                  FormInputWeb(
                    "Password",
                    obscure: true,
                    textEditingController:
                        Provider.of<AdminRegistrationProvider>(context)
                            .password,
                  ),
                  SizedBox(height: heightone * 0.01),
                  FormInputWeb(
                    "Phone Number",
                    textEditingController:
                        Provider.of<AdminRegistrationProvider>(context)
                            .phoneNumber,
                  ),
                  SizedBox(height: heightone * 0.01),
                  SizedBox(height: heightone * 0.01),
                  FormInputWeb(
                    "Credentials",
                    textEditingController:
                        Provider.of<AdminRegistrationProvider>(context)
                            .credentials,
                  ),
                  SizedBox(height: heightone * 0.01),
                  SizedBox(height: heightone * 0.01),
                  SizedBox(height: heightone * 0.01),
                  Consumer<AdminRegistrationProvider>(
                    builder: (context, value, child) {
                      return InkWell(
                        onTap: () {
                          value.signUpUser(
                              value.name.text,
                              value.email.text,
                              value.password.text,
                              value.phoneNumber.text,
                              // value.faculty,
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
          ),
        ),
      ),
    );
  }
}
