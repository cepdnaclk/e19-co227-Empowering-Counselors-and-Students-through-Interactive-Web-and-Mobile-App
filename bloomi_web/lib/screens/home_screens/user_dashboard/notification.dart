import 'package:bloomi_web/controllers/notification_controller.dart';
import 'package:bloomi_web/models/objects.dart';
import 'package:bloomi_web/providers/user_home_provider/notification_provider.dart';
import 'package:bloomi_web/providers/users/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class UserNotification {
  //---------------------------method to show dialog box input field---------------------------
  static showDialogMethod(BuildContext context) {
    final List<NotificationModel> list = [];

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: SizedBox(
            width: 400,
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
                Expanded(child: Consumer2<UserProvider, NotificationProvider>(
                  builder: (context, value, value2, child) {
                    return StreamBuilder(
                      stream: NotificationController().getNotificationByUid(
                        value.userModel!.uid,
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
                          var model = NotificationModel.fromJson(data);
                          list.add(model);
                        }

                        Logger().e(list[0].status);
                        return ListView.builder(
                          itemCount: list.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: const Icon(Icons.notifications),
                              trailing: IconButton(
                                onPressed: () {
                                  Logger().e(list[index].id);
                                  NotificationController().deleteDocument(
                                    list[index].id,
                                  );
                                },
                                icon: const Icon(Icons.delete),
                              ),
                              tileColor: Colors.grey[200],
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "${list[index].studentName} your appointment is ${list[index].status} by ${list[index].counselorName}",
                                    style: const TextStyle(
                                      fontSize: 16,
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
                )),
              ],
            ),
          ),
        );
      },
    );
  }
}
