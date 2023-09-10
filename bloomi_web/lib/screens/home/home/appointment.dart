import 'package:bloomi_web/components/custom_text.dart';
import 'package:flutter/material.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 30),
          CustomText("Appointment"),
        ],
      ),
    );
  }
}
