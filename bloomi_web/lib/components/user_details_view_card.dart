import 'package:bloomi_web/controllers/appoinment_controller.dart';
import 'package:bloomi_web/controllers/counsellor_controller.dart';
import 'package:bloomi_web/providers/users/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDetailsViewCard extends StatefulWidget {
  UserDetailsViewCard({Key? key}) : super(key: key);

  @override
  State<UserDetailsViewCard> createState() => _UserDetailsViewCardState();
}

class _UserDetailsViewCardState extends State<UserDetailsViewCard> {
  bool isSmall = false;
  bool isMini = false;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < 700) {
      isSmall = true;
    }
    if (MediaQuery.of(context).size.width < 540) {
      isMini = true;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        StreamBuilder<int>(
          stream: CounsellorController().getCounselorCount(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              int counselors = snapshot.data!;
              return customContainer('Counselors', counselors);
            } else if (snapshot.hasError) {
              return customContainer('Counselors', null);
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
        StreamBuilder<int>(
          stream: AppointmentController().getPendingCountByUserId(
              Provider.of<UserProvider>(context).userModel!.uid),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              int pending = snapshot.data!;
              return customContainer('Pending', pending);
            } else if (snapshot.hasError) {
              return customContainer('Pending', null);
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
        StreamBuilder<int>(
          stream: AppointmentController().getApprovedCountByUserId(
              Provider.of<UserProvider>(context).userModel!.uid),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              int accepted = snapshot.data!;
              return customContainer('Confirmed', accepted);
            } else if (snapshot.hasError) {
              return customContainer('Confirmed', null);
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ],
    );
  }

  Widget customContainer(String text, int? value) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 187, 187, 215),
        borderRadius: BorderRadius.circular(20),
      ),
      width: isSmall ? (isMini ? 100 : 160) : 210,
      height: isSmall ? 70 : 100,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: isSmall ? 15 : 18,
                shadows: [
                  Shadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: const Offset(2, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
            SizedBox(height: isSmall ? 5 : 10),
            Text(
              value != null ? value.toString() : 'N/A',
              style: TextStyle(
                fontSize: isSmall ? 15 : 20,
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
          ],
        ),
      ),
    );
  }
}
