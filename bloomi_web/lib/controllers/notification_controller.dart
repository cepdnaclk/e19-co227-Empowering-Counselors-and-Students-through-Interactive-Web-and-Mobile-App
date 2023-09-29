import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class NotificationController {
  CollectionReference notification =
      FirebaseFirestore.instance.collection('notification');

  //------------------------ SAVE NOTIFICATION ------------------------
  Future<void> saveNotification(
    String studentId,
    String counselorId,
    String studentName,
    String counselorName,
    String date,
    String time,
    String status,
    BuildContext context,
  ) async {
    try {
      String appointmentId = notification.doc().id;

      return notification.add({
        'id': appointmentId,
        'studentId': studentId,
        'counselorId': counselorId,
        'studentName': studentName,
        'counselorName': counselorName,
        'date': date,
        'time': time,
        'status': status,
      }).then((value) => Logger().i("Notification Added"));
    } catch (e) {
      Logger().e(e);
    }
  }

  //------------------------ DELETE NOTIFICATION ------------------------
  void deleteDocument(String uid) async {
    try {
      QuerySnapshot querySnapshot =
          await notification.where('id', isEqualTo: uid).get();

      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        await documentSnapshot.reference.delete();
      }
    } catch (e) {
      Logger().e(e);
    }
  }

  //------------------------ UPDATE NOTIFICATION ------------------------
  void updateNotificationState(String uid, String newState) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('notification')
          .where('id', isEqualTo: uid)
          .get();

      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        await documentSnapshot.reference.update({'status': newState});
      }
    } catch (e) {
      Logger().e(e);
    }
  }

  //-------------GET NOTIFICATION ACORDING TO UID-----------------
  Stream<QuerySnapshot> getNotificationByUid(String studentId) =>
      notification.where('studentId', isEqualTo: studentId).snapshots();

  //-------------GET NOTIFICATION ACORDING TO COUNSELLOR ID-----------------
  Stream<QuerySnapshot> getNotificationByCounsellorId(String counsellorId) =>
      notification.where('counselorId', isEqualTo: counsellorId).snapshots();
}
