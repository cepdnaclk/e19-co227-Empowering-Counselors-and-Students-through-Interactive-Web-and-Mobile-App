import 'package:bloomi_web/providers/user_home_provider/appointment_provider.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class CustomTimePicker extends StatelessWidget {
  const CustomTimePicker({
    super.key,
  });

  Future _selectTime(BuildContext context) async {
    final TimeOfDay selectedTime = TimeOfDay.now();
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.inputOnly,
    );

    if (pickedTime != null) {
      return pickedTime;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppointmentProvider>(
      builder: (context, value, child) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          width: 420,
          height: 50,
          decoration: BoxDecoration(
            border:
                Border.all(color: UtilConstants.blackColor.withOpacity(0.6)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                value.getDateTime.toString(),
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: () async {
                  try {
                    TimeOfDay timeOfDay = await _selectTime(context);
                    // value.setDateTime(dateTime.);
                  } catch (e) {
                    Logger().e(e);
                  }
                },
                child: const Icon(Icons.timer),
              ),
            ],
          ),
        );
      },
    );
  }
}
