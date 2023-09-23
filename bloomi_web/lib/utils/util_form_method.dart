import 'package:bloomi_web/components/custom_date_picker.dart';
import 'package:bloomi_web/components/custom_time_picker.dart';
import 'package:bloomi_web/components/form_button_web.dart';
import 'package:bloomi_web/components/form_input_web.dart';
import 'package:bloomi_web/providers/user_home_provider/appointment_provider.dart';
import 'package:bloomi_web/providers/users/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UtilFormMethod {
  //---------------------------method to show dialog box input feild---------------------------
  static showDialogMethod(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Container(
              width: 600,
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.0),
              ),
              child: AlertDialog(
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 60.0, bottom: 20.0, left: 20.0, right: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Consumer2<UserProvider, AppointmentProvider>(
                          builder: (context, value, appointment, child) {
                            return Column(
                              children: [
                                FormInputWeb(
                                  "Full Name",
                                  textEditingController: appointment.name,
                                ),
                                const SizedBox(height: 10),
                                const CustomDatePicker(),
                                const SizedBox(height: 10),
                                const CustomTimePicker(),
                              ],
                            );
                          },
                        ),
                        const SizedBox(height: 50),
                        const FormButtonWeb(
                          "Send Appointment",
                          isLoading: false,
                        ),
                      ],
                    ),
                  )
                ],
              )),
        );
      },
    );
  }
}
