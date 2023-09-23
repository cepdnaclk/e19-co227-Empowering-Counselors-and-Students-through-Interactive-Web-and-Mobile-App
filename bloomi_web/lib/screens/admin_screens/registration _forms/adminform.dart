import 'package:bloomi_web/components/form_button_web.dart';
import 'package:bloomi_web/components/form_heading.dart';
import 'package:bloomi_web/components/form_input_web.dart';
import 'package:bloomi_web/providers/admin/admin_registration_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@override
Future<void> adminregistrationform(BuildContext context) {
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
                    "Add Admins",
                  ),
                ),
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
                    Provider.of<AdminRegistrationProvider>(context).password,
              ),
              SizedBox(height: heightone * 0.01),
              FormInputWeb(
                "Phone Number",
                textEditingController:
                    Provider.of<AdminRegistrationProvider>(context).phoneNumber,
              ),
              SizedBox(height: heightone * 0.01),
              SizedBox(height: heightone * 0.01),
              FormInputWeb(
                "Credentials",
                textEditingController:
                    Provider.of<AdminRegistrationProvider>(context).credentials,
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
      );
    },
  );
}
