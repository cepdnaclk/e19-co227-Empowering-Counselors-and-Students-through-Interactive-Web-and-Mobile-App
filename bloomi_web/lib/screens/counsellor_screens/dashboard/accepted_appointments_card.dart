import 'dart:async';

import 'package:bloomi_web/controllers/appoinment_controller.dart';
import 'package:bloomi_web/providers/admin/counselor_registration_provider.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AcceptedAppointments extends StatefulWidget {
  const AcceptedAppointments({super.key});

  @override
  State<AcceptedAppointments> createState() => _AcceptedAppointmentsState();
}

class _AcceptedAppointmentsState extends State<AcceptedAppointments> {
  int? count;

  @override
  void initState() {
    super.initState();
    count = 0;
    fetchAppointmentsCount();
  }

  void fetchAppointmentsCount() {
    final provider =
        Provider.of<CounsellorRegistrationProvider>(context, listen: false);
    Stream<int> appointmentsStream = AppointmentController()
        .getApprovedCountByCounselorId(provider.counsellorModel!.uid);

    appointmentsStream.listen((snapshot) {
      setState(() {
        count = snapshot;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: const Color.fromARGB(255, 186, 200, 225),
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
              count?.toString() ?? '0',
              style: TextStyle(fontSize: width < 480 ? 13.0 : 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
