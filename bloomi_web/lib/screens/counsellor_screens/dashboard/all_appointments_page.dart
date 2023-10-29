import 'package:bloomi_web/controllers/appoinment_controller.dart';
import 'package:bloomi_web/models/objects.dart';
import 'package:bloomi_web/providers/admin/counselor_registration_provider.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllAppointmentsCounselor extends StatelessWidget {
  const AllAppointmentsCounselor({
    Key? key,
  }) : super(key: key);

  Color getAppointmentStateColor(String state) {
    if (state == 'Pending') {
      return Colors.orange;
    } else if (state == 'Confirmed') {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }

  Widget buildRichText(
    String text, {
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? 16,
        color: color ?? Colors.black,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;

        int columns = 1;

        if (screenWidth > 600) {
          columns = 2;
        }

        if (screenWidth > 1200) {
          columns = 3;
        }

        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Consumer<CounsellorRegistrationProvider>(
              builder: (context, value, child) {
                return StreamBuilder(
                  stream: AppointmentController()
                      .getAppointmentsByUid(value.counsellorModel!.uid),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text(
                          "Something went wrong",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (snapshot.data!.docs.isEmpty) {
                      return const Center(
                        child: Text(
                          "No Appointment found",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }

                    List<AppointmentModel> list = [];

                    for (var e in snapshot.data!.docs) {
                      Map<String, dynamic> data =
                          e.data() as Map<String, dynamic>;
                      var model = AppointmentModel.fromJson(data);
                      list.add(model);
                    }

                    return Column(
                      children: [
                        Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: columns,
                              childAspectRatio: 1.0,
                              mainAxisSpacing: 8.0,
                              crossAxisSpacing: 8.0,
                              mainAxisExtent: 192.0,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                color: Colors.white,
                                elevation: 10,
                                shadowColor: Colors.grey.withOpacity(0.4),
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      buildRichText(
                                        "Appointment Details",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 18.0,
                                      ),
                                      const Divider(
                                        thickness: 2,
                                        height: 10,
                                        color: UtilConstants.blackColor,
                                      ),
                                      const SizedBox(height: 8),
                                      buildRichText(
                                        "Counselor Name: ${list[index].studentName}",
                                        fontSize: 16.0,
                                      ),
                                      buildRichText(
                                        "Appointment Date: ${list[index].date.toString().substring(0, 10)}",
                                        fontSize: 16.0,
                                      ),
                                      buildRichText(
                                        "Appointment Time: ${list[index].time}",
                                        fontSize: 16.0,
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Container(
                                            width: 10,
                                            height: 10,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: getAppointmentStateColor(
                                                  list[index].status),
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          buildRichText(
                                            list[index].status,
                                            color: getAppointmentStateColor(
                                                list[index].status),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount: list.length,
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
