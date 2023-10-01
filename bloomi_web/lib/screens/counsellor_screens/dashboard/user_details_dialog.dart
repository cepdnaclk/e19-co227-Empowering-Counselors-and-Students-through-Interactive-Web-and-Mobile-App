import 'package:bloomi_web/controllers/appoinment_controller.dart';

import 'package:bloomi_web/models/objects.dart';
import 'package:bloomi_web/utils/util_constant.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserDetailsDialog extends StatelessWidget {
  final String uId;
  final String userName;

  const UserDetailsDialog(
      {super.key, required this.uId, required this.userName});

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
    return FutureBuilder<List<AppointmentModel>>(
      future: _getAppointments(),
      builder: (BuildContext context,
          AsyncSnapshot<List<AppointmentModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Something went wrong"),
          );
        } else if (snapshot.hasData) {
          final List<AppointmentModel> list = snapshot.data!;

          return AlertDialog(
            actions: [
              SizedBox(
                width: 200,
                height: 400,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                              "Counselor Name: ${list[index].counselorName}",
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
        } else {
          return Center(
            child: Text('No appointments available'),
          );
        }
      },
    );
  }

  Future<List<AppointmentModel>> _getAppointments() async {
    try {
      final appointmentController = AppointmentController();
      final QuerySnapshot querySnapshot =
          await appointmentController.getCounselorAppointment(uId).first;

      final List<AppointmentModel> list = [];
      for (final QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        final Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        final model = AppointmentModel.fromJson(data);
        list.add(model);
      }

      return list;
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
