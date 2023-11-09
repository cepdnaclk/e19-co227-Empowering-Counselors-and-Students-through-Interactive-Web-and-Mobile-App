import 'package:bloomi_web/components/counselor_list_view.dart';
import 'package:bloomi_web/components/custom_card_widget.dart';
import 'package:bloomi_web/components/footer.dart';
import 'package:bloomi_web/components/user_details_view_card.dart';
import 'package:flutter/material.dart';

class UserAppointmentDashboard extends StatefulWidget {
  const UserAppointmentDashboard({super.key});

  @override
  State<UserAppointmentDashboard> createState() =>
      _UserAppointmentDashboardState();
}

class _UserAppointmentDashboardState extends State<UserAppointmentDashboard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    UserDetailsViewCard(),
                    const SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        height: 400,
                        child: CounselorListView(),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      "Your Appointments",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const CustomCardWidget(),
                  ],
                ),
              ),
              Footer(height: 55, width: width),
            ],
          ),
        ),
      ),
    );
  }
}
