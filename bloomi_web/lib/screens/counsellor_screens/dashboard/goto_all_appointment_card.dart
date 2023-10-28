import 'package:bloomi_web/screens/counsellor_screens/dashboard/all_appointments_card.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class GoToAllAppointments extends StatefulWidget {
  const GoToAllAppointments({Key? key}) : super(key: key);

  @override
  State<GoToAllAppointments> createState() => _GoToAllAppointmentsState();
}

//fetch no of pending appointments
int count = 0;
bool isHovered = false;

class _GoToAllAppointmentsState extends State<GoToAllAppointments> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      cursor: isHovered ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AllAppointments(),
            ),
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: isHovered
              ? Color.fromARGB(255, 175, 194, 211) // Hovered color
              : const Color.fromARGB(255, 155, 172, 187), // Default color
          elevation: 10,
          shadowColor: UtilConstants.greyColor.withOpacity(0.8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Go to All Appointments",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: width < 480 ? 13.0 : 15.0,
                  ),
                ),
                const SizedBox(height: 8),
                const Icon(
                  Icons.arrow_forward,
                  size: 20,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
