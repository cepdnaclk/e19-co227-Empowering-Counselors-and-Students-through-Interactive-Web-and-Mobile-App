import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class CustomTimePicker extends StatelessWidget {
  const CustomTimePicker({
    super.key,
  });

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay selectedTime = TimeOfDay.now();
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      // Handle the picked time if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    final TimeOfDay selectedTime = TimeOfDay.now();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      width: 420,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: UtilConstants.blackColor.withOpacity(0.6)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            selectedTime.format(context),
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(width: 10),
          InkWell(
            onTap: () {
              _selectTime(context);
            },
            child: const Icon(Icons.timer),
          ),
        ],
      ),
    );
  }
}
