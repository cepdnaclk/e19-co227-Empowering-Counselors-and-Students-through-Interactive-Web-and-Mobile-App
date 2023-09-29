import 'package:bloomi_web/models/objects.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final List<AppointmentModel> list;
  final int index;

  const CustomCardWidget({
    Key? key,
    required this.list,
    required this.index,
  }) : super(key: key);

  Color getAppointmentStateColor(String state) {
    if (state == 'Pending') {
      return Colors.orange;
    } else if (state == 'Confirmed') {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    final appointmentStateColor = getAppointmentStateColor('Pending');

    return SizedBox(
      child: Card(
        color: UtilConstants.lightgreyColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Appointment Details",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  shadows: [
                    Shadow(
                      blurRadius: 3.0,
                      color: Colors.grey,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
                height: 16,
                color: UtilConstants.blackColor,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Student Name: ${list[index].studentName}",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Student Email: ${list[index].studentEmail}",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Student Faculty: ${list[index].studentFaculty}",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Counselor Name: ${list[index].counselorName}",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Appointment Date: ${list[index].date.toString().substring(0, 10)}",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Appointment Time: ${list[index].time}",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: appointmentStateColor,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Pending',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: appointmentStateColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
