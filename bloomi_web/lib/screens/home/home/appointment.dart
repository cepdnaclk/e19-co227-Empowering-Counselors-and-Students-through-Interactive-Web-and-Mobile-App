import 'package:bloomi_web/screens/home/home/user_apoinment_dashboard.dart';
import 'package:flutter/material.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  @override
  Widget build(BuildContext context) {
    return const UserAppoinmentDashboard();
  }
}
