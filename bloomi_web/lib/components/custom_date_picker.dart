import 'package:bloomi_web/providers/user_home_provider/appointment_provider.dart';
import 'package:bloomi_web/utils/util_function.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 420,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Consumer<AppointmentProvider>(
          builder: (context, value, child) {
            return TextFormField(
              controller: TextEditingController(
                  text: DateFormat('yyyy-MM-dd').format(value.getDateTime)),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () async {
                    // Call the function to show the date picker dialog
                    try {
                      DateTime dateTime =
                          await UtilFunction.selectDate(context);

                      value.setDateTime(dateTime);
                    } catch (e) {
                      Logger().e(e);
                    }
                    // ignore: use_build_context_synchronously
                  },
                ),
              ),
            );
          },
        ));
  }
}



// Function to show the date picker dialog
