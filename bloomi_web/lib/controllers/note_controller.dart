import 'package:bloomi_web/utils/util_method.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class NoteController {
  CollectionReference notes = FirebaseFirestore.instance.collection('note');

  //------------------------ SAVE NOTE ------------------------
  Future<void> saveNotes(
      String title, String description, BuildContext context) async {
    try {
      String noteId = notes.doc().id;

      return notes.add({
        'id': noteId,
        'title': title,
        'description': description,
      }).then((value) {
        UtilMethod.customDialogBox(
            context, "Success", "Note Added Successfully");
        // ignore: invalid_return_type_for_catch_error
      }).catchError((error) => Logger().e("Failed to add user: $error"));
    } catch (e) {
      Logger().e(e);
    }
  }

  //------------------------ GET NOTE ------------------------
  Stream<QuerySnapshot> getNotes() => notes.snapshots();

  // Future<List<NoteModel>> fetchAllNotes() async {
  //   try {
  //     QuerySnapshot querySnapshot = await notes.get();
  //     Logger().i(querySnapshot.docs.length);

  //     //------temp list-------
  //     List<NoteModel> list = [];

  //     for (var e in querySnapshot.docs) {
  //       //------mapping data to user model-------
  //       NoteModel allNotes =
  //           NoteModel.fromJson(e.data() as Map<String, dynamic>);

  //       //------adding user model to list-------
  //       list.add(allNotes);
  //     }
  //     return list;
  //   } catch (e) {
  //     Logger().e(e);

  //     return [];
  //   }
  // }
}
