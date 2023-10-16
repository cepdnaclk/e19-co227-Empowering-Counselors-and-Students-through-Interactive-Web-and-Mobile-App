import 'package:bloomi_web/components/custom_date_picker.dart';
import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/components/custom_time_picker.dart';
import 'package:bloomi_web/components/form_input_web.dart';
import 'package:bloomi_web/providers/user_home_provider/appointment_provider.dart';
import 'package:bloomi_web/providers/user_home_provider/notification_provider.dart';
import 'package:bloomi_web/providers/users/user_provider.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class UtilFormMethod {
  //---------------------------method to show dialog box input feild---------------------------
  static showDialogMethod(
      BuildContext context, String counselorId, String counselorName) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Container(
              width: 600,
              height: 600,
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
                                const SizedBox(height: 10),
                                FormInputWeb(
                                  "Enter the Note",
                                  textEditingController: appointment.note,
                                  maxLine: 4,
                                ),
                              ],
                            );
                          },
                        ),
                        const SizedBox(height: 50),
                        Consumer3<AppointmentProvider, UserProvider,
                            NotificationProvider>(
                          builder: (context, value, value2, value3, child) {
                            return ElevatedButton(
                              onPressed: () async {
                                try {
                                  value
                                      .saveAppointment(
                                    context,
                                    value2.userModel!.uid,
                                    counselorId,
                                    value.name.text,
                                    counselorName,
                                    value2.userModel!.email,
                                    value2.userModel!.faculty,
                                    value.getDateTime.toString(),
                                    value.getTimeOfDay.format(context),
                                    "Pending",
                                    value.note.text,
                                  )
                                      .then((value1) {
                                    value3.saveNotification(
                                      context,
                                      value2.userModel!.uid,
                                      counselorId,
                                      value2.userModel!.name,
                                      counselorName,
                                      value.getDateTime.toString(),
                                      value.getTimeOfDay.format(context),
                                      "Pending",
                                      value.note.text,
                                    );
                                  });
                                } catch (e) {
                                  Logger().e(e);
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith(
                                  (states) {
                                    if (states
                                        .contains(MaterialState.hovered)) {
                                      return UtilConstants.greenColor;
                                    }
                                    return UtilConstants.greenColor;
                                  },
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    const Size(double.infinity, 60)),
                              ),
                              child: value.isLoading
                                  ? const CircularProgressIndicator.adaptive()
                                  : const CustomText(
                                      "Add Appointment",
                                      fontColor: UtilConstants.blackColor,
                                      fontSize: 15,
                                    ),
                            );
                          },
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
