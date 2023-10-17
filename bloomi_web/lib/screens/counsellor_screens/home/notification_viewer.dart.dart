import 'package:bloomi_web/controllers/appoinment_controller.dart';
import 'package:bloomi_web/controllers/notification_controller.dart';
import 'package:bloomi_web/controllers/send_email_controller.dart';
import 'package:bloomi_web/models/objects.dart';
import 'package:bloomi_web/providers/admin/counselor_registration_provider.dart';
import 'package:bloomi_web/providers/counselor/counsellor_appointment_provider.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class UtilFormMethodNotification {
  //---------------------------method to show dialog box input field---------------------------
  static showDialogMethod(BuildContext context) {
    List<AppointmentModel> list = [];
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: SizedBox(
            width: 800,
            height: 410,
            child: Column(
              children: [
                const Text(
                  'Notifications',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const Divider(),
                Expanded(
                  child: Consumer<CounsellorRegistrationProvider>(
                    builder: (context, value, child) {
                      return StreamBuilder(
                        stream: NotificationController()
                            .getNotificationByCounsellorId(
                          value.counsellorModel!.uid,
                        ),
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
                              child: Text("No Notes found"),
                            );
                          }

                          Logger().i(snapshot.data!.docs.length);

                          //-------------clear the list before adding new data----------------
                          list.clear();

                          //-----------------read the document list from snapshot and map to model and add to list----------------
                          for (var e in snapshot.data!.docs) {
                            Map<String, dynamic> data =
                                e.data() as Map<String, dynamic>;
                            var model = AppointmentModel.fromJson(data);
                            list.add(model);
                          }

                          return ListView.builder(
                            itemCount: list.length,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return ListTile(
                                tileColor: Colors.grey[
                                    200], // Change the tile background color
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Student Name: ${list[index].studentName}',
                                    ),
                                    // Text('Student Faculty: $faculty'),
                                    Text(
                                        'Appointment Date: ${list[index].date}'),
                                    Text(
                                        'Appointment Time: ${list[index].time}'),
                                    Text(
                                        'Appointment Notes: ${list[index].note}'),
                                    Text(
                                        'Appointment state: ${list[index].status}'),
                                    const SizedBox(height: 10),
                                    TextField(
                                      controller: Provider.of<
                                          CounsellorAppointmentProvider>(
                                        context,
                                      ).note,
                                      maxLines: 5,
                                      decoration: const InputDecoration(
                                        hintText: 'Enter the note',
                                        border: OutlineInputBorder(),
                                      ),
                                    )
                                  ],
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    MouseRegion(
                                      onEnter: (_) {
                                        (context as Element).markNeedsBuild();
                                      },
                                      onExit: (_) {
                                        (context as Element).markNeedsBuild();
                                      },
                                      child: ElevatedButton(
                                        onPressed: () {
                                          try {
                                            NotificationController()
                                                .deleteNotificationState(
                                              list[index].id,
                                              'Approved',
                                            );

                                            AppointmentController()
                                                .updateAppointmentState(
                                                    value.counsellorModel!.uid,
                                                    'Approved');
                                          } catch (e) {
                                            Logger().e(e);
                                          }

                                          Provider.of<CounsellorAppointmentProvider>(
                                                  context,
                                                  listen: false)
                                              .changeAppointment(
                                                  value.counsellorModel!.uid,
                                                  context)
                                              .then((value2) {
                                            SendEmailController()
                                                .sendEmailToUser(
                                                    name:
                                                        list[index].studentName,
                                                    email: list[index]
                                                        .studentEmail,
                                                    message: value2!,
                                                    reciverName: list[index]
                                                        .counselorName);
                                          });
                                        },
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty
                                              .resolveWith<Color>(
                                            (states) {
                                              if (states.contains(
                                                  MaterialState.hovered)) {
                                                return Colors
                                                    .blue; // Change to the hover color
                                              }
                                              return Colors
                                                  .green; // Default button color
                                            },
                                          ),
                                          overlayColor: MaterialStateProperty
                                              .resolveWith<Color>(
                                            (states) {
                                              if (states.contains(
                                                  MaterialState.hovered)) {
                                                return Colors.blue.withOpacity(
                                                    0.2); // Change to the overlay color when hovered
                                              }
                                              return Colors.green.withOpacity(
                                                  0.2); // Default overlay color
                                            },
                                          ),
                                        ),
                                        child: const Text('Approve'),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    MouseRegion(
                                      onEnter: (_) {
                                        (context as Element).markNeedsBuild();
                                      },
                                      onExit: (_) {
                                        (context as Element).markNeedsBuild();
                                      },
                                      child: ElevatedButton(
                                        onPressed: () {
                                          AppointmentController()
                                              .updateAppointmentState(
                                                  value.counsellorModel!.uid,
                                                  'Declined');
                                        },
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty
                                              .resolveWith<Color>(
                                            (states) {
                                              if (states.contains(
                                                  MaterialState.hovered)) {
                                                return Colors
                                                    .red; // Change to the hover color
                                              }
                                              return Colors
                                                  .orange; // Default button color
                                            },
                                          ),
                                          overlayColor: MaterialStateProperty
                                              .resolveWith<Color>(
                                            (states) {
                                              if (states.contains(
                                                  MaterialState.hovered)) {
                                                return Colors.red.withOpacity(
                                                    0.2); // Change to the overlay color when hovered
                                              }
                                              return Colors.orange.withOpacity(
                                                  0.2); // Default overlay color
                                            },
                                          ),
                                        ),
                                        child: const Text('Decline'),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
