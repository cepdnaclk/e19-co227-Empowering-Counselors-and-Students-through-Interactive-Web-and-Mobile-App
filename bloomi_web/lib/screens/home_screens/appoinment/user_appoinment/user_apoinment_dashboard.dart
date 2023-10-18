import 'package:bloomi_web/components/counselor_list_view.dart';
import 'package:bloomi_web/components/custom_card_widget.dart';
import 'package:bloomi_web/components/footer.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class UserAppointmentDashboard extends StatefulWidget {
  const UserAppointmentDashboard({Key? key}) : super(key: key);

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
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 187, 187, 215),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            width: 200,
                            height: 150,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "No of Appointments",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      shadows: [
                                        Shadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          offset: const Offset(2, 2),
                                          blurRadius: 4,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    "10",
                                    style: TextStyle(
                                      fontSize: 16,
                                      shadows: [
                                        Shadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          offset: const Offset(2, 2),
                                          blurRadius: 4,
                                        ),
                                      ],
                                    ),
                                  ), // get from DB
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 90),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 187, 187, 215),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            width: 200,
                            height: 150,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "No of Counselors ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      shadows: [
                                        Shadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          offset: const Offset(2, 2),
                                          blurRadius: 4,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    "10",
                                    style: TextStyle(
                                      fontSize: 16,
                                      shadows: [
                                        Shadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          offset: const Offset(2, 2),
                                          blurRadius: 4,
                                        ),
                                      ],
                                    ),
                                  ), // get from DB
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 90),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 187, 187, 215),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            width: 200,
                            height: 150,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "No of Appointments",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      shadows: [
                                        Shadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          offset: const Offset(2, 2),
                                          blurRadius: 4,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    "10",
                                    style: TextStyle(
                                      fontSize: 16,
                                      shadows: [
                                        Shadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          offset: const Offset(2, 2),
                                          blurRadius: 4,
                                        ),
                                      ],
                                    ),
                                  ), // get from DB
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        height: 400,
                        child: CounselorListView(),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Your Appointments",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomCardWidget(),
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
