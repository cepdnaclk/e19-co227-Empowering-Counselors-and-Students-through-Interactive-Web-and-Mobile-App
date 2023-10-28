import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class AllAppointments extends StatefulWidget {
  const AllAppointments({Key? key}) : super(key: key);

  @override
  State<AllAppointments> createState() => _AllAppointmentsState();
}

Map<String, dynamic> All = {
  "name": "Sajani",
  "email": "e19000@eng.pdn.ac.lk",
  "date": "12 / 10 / 2023",
  "time": "10:00 a.m.",
  "state": "Confirmed",
};

Color getAppointmentStateColor(String state) {
  if (state == 'Pending') {
    return Colors.orange;
  } else if (state == 'Confirmed') {
    return Colors.red;
  } else {
    return Colors.green;
  }
}

class _AllAppointmentsState extends State<AllAppointments> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: UtilConstants.whiteColor,
        elevation: 10,
        shadowColor: UtilConstants.greyColor.withOpacity(0.4),
        child: Padding(
          padding: width < 480
              ? const EdgeInsets.symmetric(horizontal: 20, vertical: 20)
              : const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Your Next Appointment",
                  style: TextStyle(
                    fontSize: 22,
                    color: UtilConstants.actionColor.withOpacity(0.9),
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.grey.withOpacity(0.5),
                        offset: const Offset(2, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                "Appointment Details",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: width < 480 ? 16.0 : 18.0,
                ),
              ),
              Divider(
                thickness: 2,
                height: 15,
                color: UtilConstants.blackColor.withOpacity(0.5),
              ),
              const SizedBox(height: 10),
              Text(
                // ignore: prefer_interpolation_to_compose_strings
                "Student Name: ${All["name"]}",
                style: TextStyle(fontSize: width < 480 ? 14.0 : 16.0),
              ),
              Text(
                "Appointment Date: ${All["date"].toString().substring(0, 10)}",
                style: TextStyle(fontSize: width < 480 ? 14.0 : 16.0),
              ),
              Text(
                "Appointment Time: ${All["time"]}",
                style: TextStyle(fontSize: width < 480 ? 14.0 : 16.0),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: getAppointmentStateColor(All["state"]),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    All["state"],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: width < 480 ? 14.0 : 16.0,
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
