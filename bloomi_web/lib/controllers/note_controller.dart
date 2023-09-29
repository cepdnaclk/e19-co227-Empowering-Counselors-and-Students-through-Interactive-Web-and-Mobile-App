import 'package:bloomi_web/utils/util_method.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class NoteController {
  CollectionReference notes = FirebaseFirestore.instance.collection('note');

  //------------------------ SAVE NOTE ------------------------
  Future<void> saveNotes(String title, String description, BuildContext context,
      String userId) async {
    try {
      String noteId = notes.doc().id;

      return notes.add({
        'userId': userId,
        'id': noteId,
        'title': title,
        'description': description,
      }).then((value) {
        UtilMethod.customDialogBox(
          context,
          "Success",
          "Note Added Successfully",
          onCancelPressed: () {},
          onOkPressed: () {},
        );
        // ignore: invalid_return_type_for_catch_error
      }).catchError((error) => Logger().e("Failed to add user: $error"));
    } catch (e) {
      Logger().e(e);
    }
  }

  //------------------------ GET NOTE ------------------------
  Stream<QuerySnapshot> getNotes() => notes.snapshots();

  //-------------GET NOTES ACORDING TO UID-----------------
  Stream<QuerySnapshot> getNotesByUid(String studentId) =>
      notes.where('userId', isEqualTo: studentId).snapshots();
}
