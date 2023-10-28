import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class AcceptedAppointments extends StatefulWidget {
  const AcceptedAppointments({Key? key}) : super(key: key);

  @override
  State<AcceptedAppointments> createState() => _AcceptedAppointmentsState();
}

//fetch no of accepted appointments
int count = 0;

class _AcceptedAppointmentsState extends State<AcceptedAppointments> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Color.fromARGB(255, 186, 200, 225),
      elevation: 10,
      shadowColor: UtilConstants.greyColor.withOpacity(0.8),
      child: Padding(
        padding: width < 480
            ? const EdgeInsets.symmetric(horizontal: 10, vertical: 20)
            : const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Accepted Appointments",
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
