import 'package:bloomi_web/components/calender.dart';
import 'package:bloomi_web/components/counselor_list_view.dart';
import 'package:bloomi_web/components/custom_card_widget.dart';
import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/components/dropdown_button.dart';
import 'package:bloomi_web/controllers/appoinment_controller.dart';
import 'package:bloomi_web/controllers/counsellor_controller.dart';
import 'package:bloomi_web/models/objects.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class UserAppointmentDashboard extends StatefulWidget {
  const UserAppointmentDashboard({Key? key}) : super(key: key);

  @override
  State<UserAppointmentDashboard> createState() =>
      _UserAppointmentDashboardState();
}

class _UserAppointmentDashboardState extends State<UserAppointmentDashboard> {
  final List<AppointmentModel> _list = [];
  final List<CounsellorModel> _listCounsellor = [];
  final List<String> _listCounsellorName = [];
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
                            child: Column(
                              children: [
                                StreamBuilder(
                                  stream:
                                      CounsellorController().getCounsellors(),
                                  builder: (context, snapshot) {
                                    //-------if the snapshot error occurs, show error message-------
                                    if (snapshot.hasError) {
                                      return const Center(
                                        child: Text("Something went wrong"),
                                      );
                                    }

                                    //-------if the snapshot is waiting, show progress indicator-------
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }

                                    if (snapshot.data!.docs.isEmpty) {
                                      return const Center(
                                        child: Text("No Counsellor found"),
                                      );
                                    }

                                    Logger().i(snapshot.data!.docs.length);

                                    //-------------clear the list before adding new data----------------
                                    _listCounsellor.clear();

                                    //-----------------read the document list from snapshot and map to model and add to list----------------
                                    for (var e in snapshot.data!.docs) {
                                      Map<String, dynamic> data =
                                          e.data() as Map<String, dynamic>;
                                      var model =
                                          CounsellorModel.fromJson(data);
                                      _listCounsellor.add(model);
                                      _listCounsellorName.add(model.name);
                                    }

                                    return DropDownButtonWidget(
                                        listItem: _listCounsellorName,
                                        text: "Select Counselor",
                                        index: 1);
                                  },
                                ),
                                const Calender(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const CustomText(
                    "Your Appointment",
                    fontColor: UtilConstants.blackColor,
                    fontSize: 24,
                  ),
                  SizedBox(
                      height: 220,
                      child: StreamBuilder(
                        stream: AppointmentController().getAppointment(),
                        builder: (context, snapshot) {
                          //-------if the snapshot error occurs, show error message-------
                          if (snapshot.hasError) {
                            return const Center(
                              child: Text("Something went wrong"),
                            );
                          }

                          //-------if the snapshot is waiting, show progress indicator-------
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          if (snapshot.data!.docs.isEmpty) {
                            return const Center(
                              child: Text("No Appointment found"),
                            );
                          }

                          Logger().i(snapshot.data!.docs.length);

                          //-------------clear the list before adding new data----------------
                          _list.clear();

                          //-----------------read the document list from snapshot and map to model and add to list----------------
                          for (var e in snapshot.data!.docs) {
                            Map<String, dynamic> data =
                                e.data() as Map<String, dynamic>;
                            var model = AppointmentModel.fromJson(data);
                            _list.add(model);
                          }

                          return GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.all(20),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1, childAspectRatio: 6.8),
                            itemBuilder: (BuildContext context, int index) {
                              return CustomCardWidget(
                                list: _list,
                                index: index,
                              );
                            },
                            itemCount: _list.length,
                          );
                        },
                      ))
                ],
              ),
            )),
      ),
    );
  }
}
