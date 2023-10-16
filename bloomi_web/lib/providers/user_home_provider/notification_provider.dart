import 'package:bloomi_web/controllers/notification_controller.dart';
import 'package:bloomi_web/utils/util_method.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

//------------------------ Notification PROVIDER ------------------------
class NotificationProvider extends ChangeNotifier {
  //------------------------ SAVE Notification ------------------------
  Future<void> saveNotification(
    BuildContext context,
    String studentId,
    String counselorId,
    String studentName,
    String counselorName,
    String date,
    String time,
    String status,
    String note,
  ) async {
    try {
      if (studentId.isNotEmpty &&
          counselorId.isNotEmpty &&
          studentName.isNotEmpty &&
          counselorName.isNotEmpty &&
          date.isNotEmpty &&
          time.isNotEmpty &&
          status.isNotEmpty) {
        await NotificationController().saveNotification(
          studentId,
          counselorId,
          studentName,
          counselorName,
          date,
          time,
          status,
          context,
          note,
        );
        notifyListeners();
      } else {
        UtilMethod.customDialogBox(
            context, "Error", "Please fill all the fields");
      }

      // Clear text fields after saving
    } catch (e) {
      Logger().e(e);
    }
  }
}
