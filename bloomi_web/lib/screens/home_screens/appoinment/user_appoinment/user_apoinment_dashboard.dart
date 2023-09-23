import 'package:bloomi_web/components/calender.dart';
import 'package:bloomi_web/components/counselor_list_view.dart';
import 'package:bloomi_web/components/custom_card_widget.dart';
import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/components/dropdown_button.dart';
import 'package:bloomi_web/providers/user_home_provider/user_appoinment_provider.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserAppointmentDashboard extends StatefulWidget {
  const UserAppointmentDashboard({Key? key}) : super(key: key);

  @override
  State<UserAppointmentDashboard> createState() =>
      _UserAppointmentDashboardState();
}

class _UserAppointmentDashboardState extends State<UserAppointmentDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 10.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        const Column(
                          children: [
                            Text(
                              "Available Counsellors",
                              style: TextStyle(
                                fontSize: 25,
                                color: UtilConstants.blackColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: SizedBox(
                                height: 300,
                                width: 600,
                                child: CounselorListView(),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 120,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black),
                            ),
                            child: Consumer<UserAppoinmentProvider>(
                              builder: (context, value, child) {
                                return Column(
                                  children: [
                                    DropDownButtonWidget(
                                        listItem: value.allCounselorNameModel,
                                        text: "Select Counselor",
                                        index: 1),
                                    const Calender(),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomText(
                    "Your Appointment",
                    fontColor: UtilConstants.blackColor,
                    fontSize: 24,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 220,
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(20),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, childAspectRatio: 2.3),
                      itemBuilder: (BuildContext context, int index) {
                        return const CustomCardWidget();
                      },
                      itemCount: 6,
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
