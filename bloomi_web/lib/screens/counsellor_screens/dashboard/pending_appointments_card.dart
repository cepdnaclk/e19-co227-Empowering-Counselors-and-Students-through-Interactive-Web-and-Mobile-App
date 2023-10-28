import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class PendingAppointments extends StatefulWidget {
  const PendingAppointments({Key? key}) : super(key: key);

  @override
  State<PendingAppointments> createState() => _PendingAppointmentsState();
}

//fetch no of pending appointments
int count = 0;

class _PendingAppointmentsState extends State<PendingAppointments> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: UtilConstants.whiteColor,
      elevation: 10,
      shadowColor: UtilConstants.greyColor.withOpacity(0.8),
      child: Padding(
        padding: width < 480
            ? const EdgeInsets.symmetric(horizontal: 10, vertical: 20)
            : const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Pending Appointments",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: width < 480 ? 13.0 : 15.0,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "$count",
              style: TextStyle(fontSize: width < 480 ? 13.0 : 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
