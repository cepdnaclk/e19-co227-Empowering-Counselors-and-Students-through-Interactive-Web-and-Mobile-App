// ignore_for_file: use_build_context_synchronously

import 'package:bloomi_web/models/objects.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:bloomi_web/utils/util_method.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AdminController {
  //-----------------------To SignUp Admin---------------------
  Future<void> signUpAdmin(
      String email,
      String password,
      String name,
      String phone,
      String userCredential,
      String userType,
      BuildContext context,
      String uId,
      bool isTrue) async {
    try {
      if (isTrue == false) {
        String id = admins.doc().id;
        saveAdminData(AdminModel(
            uid: id,
            name: name,
            email: email,
            phone: phone,
            credential: userCredential,
            userType: userType,
            imgUrl: ""));

        saveUserAdditionalData(ChatModel(
            uid: id,
            name: name,
            email: email,
            img: "",
            lastSeen: DateTime.now().toString(),
            isOnline: true,
            token: "",
            userType: userType));
      } else {
        saveAdminData(AdminModel(
            uid: uId,
            name: name,
            email: email,
            phone: phone,
            credential: userCredential,
            userType: userType,
            imgUrl: ""));

        saveUserAdditionalData(ChatModel(
            uid: uId,
            name: name,
            email: email,
            img: "",
            lastSeen: DateTime.now().toString(),
            isOnline: true,
            token: "",
            userType: userType));
      }
    } on FirebaseAuthException catch (e) {
      UtilMethod.customDialogBox(
        context,
        "Error",
        e.code,
        onCancelPressed: () {},
        onOkPressed: () {},
      );
      Logger().e(e);
    } catch (e) {
      Logger().e(e);
    }
  }

  //----------------------saving Admin data in cloud firestore---------------------
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference admins = FirebaseFirestore.instance.collection('admins');

  Future<void> saveAdminData(AdminModel adminModel) {
    return admins
        .doc(adminModel.uid)
        .set({
          'uid': adminModel.uid,
          'name': adminModel.name,
          'email': adminModel.email,
          'phone': adminModel.phone,
          'credential': adminModel.credential,
          'userType': adminModel.userType,
          'imgUrl': UtilConstants.dummyProfileUrl,
        })
        .then((value) => Logger().i("User Added"))
        .catchError((error) => Logger().e("Failed to add user: $error"));
  }

  //----------------------update Admin data in cloud firestore---------------------

  Future<void> updateAdminData(AdminModel adminModel) {
    return admins
        .doc(adminModel.uid)
        .update({
          'uid': adminModel.uid,
          'name': adminModel.name,
          'email': adminModel.email,
          'phone': adminModel.phone,
          'credential': adminModel.credential,
          'userType': adminModel.userType,
          'imgUrl': UtilConstants.dummyProfileUrl,
        })
        .then((value) => Logger().i("User updated"))
        .catchError((error) => Logger().e("Failed to update user: $error"));
  }

  //----------------------update Admin data in cloud firestore---------------------

  Future<void> deleteAdminData(String uid) {
    return admins
        .doc(uid)
        .delete()
        .then((value) => Logger().i("User deleted"))
        .catchError((error) => Logger().e("Failed to delete user: $error"));
  }

  //-----------------------fetch admin data from database---------------------
  Future<AdminModel?> fetchAdminData(String adminId) async {
    try {
      //-------firebase quary to fetch admin data from database--------
      DocumentSnapshot documentSnapshot = await admins.doc(adminId).get();

      Logger().i(documentSnapshot.data());

      //-------mapping admin data to admin model--------
      AdminModel admin =
          AdminModel.fromJson(documentSnapshot.data() as Map<String, dynamic>);

      return admin;
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }

  // List<AdminModel>? allAdmin;

  // List<AdminModel>? get admin => allAdmin;
  // //-----------------------fetch admin data from database---------------------
  // Future<List<AdminModel>?> fetchAllAdminData() async {
  //   try {
  //     //-------firebase quary to fetch admin data from database--------
  //     QuerySnapshot querySnapshot = await admins.get();

  //     Logger().i(querySnapshot.docs.length);

  //     for (var e in querySnapshot.docs) {
  //       AdminModel admin =
  //           AdminModel.fromJson(e.data() as Map<String, dynamic>);

  //       allAdmin!.add(admin);
  //     }

  //     return allAdmin;
  //   } catch (e) {
  //     Logger().e(e);
  //     return null;
  //   }
  // }

  //----------------------saving admin additional data in cloud firestore---------------------

  CollectionReference additionalAdmin =
      FirebaseFirestore.instance.collection('additionalAdmin');

  Future<void> saveUserAdditionalData(ChatModel chatModel) {
    return additionalAdmin
        .doc(chatModel.uid)
        .set({
          'uid': chatModel.uid,
          'name': chatModel.name,
          'email': chatModel.email,
          'img': UtilConstants.dummyProfileUrl,
          'lastSeen': chatModel.lastSeen,
          'isOnline': chatModel.isOnline,
          'token': chatModel.token,
          'userType': chatModel.userType,
        })
        .then((value) => Logger().i("User Added"))
        .catchError((error) => Logger().e("Failed to add user: $error"));
  }

  //-----------------------To update Admin---------------------
  Future<void> updateAdmin(
    String email,
    String password,
    String name,
    String phone,
    String userCredential,
    String userType,
    BuildContext context,
    String uId,
  ) async {
    try {
      updateAdminData(AdminModel(
          uid: uId,
          name: name,
          email: email,
          phone: phone,
          credential: userCredential,
          userType: 'Admin',
          imgUrl: ""));

      saveUserAdditionalData(ChatModel(
          uid: uId,
          name: name,
          email: email,
          img: "",
          lastSeen: DateTime.now().toString(),
          isOnline: true,
          token: "",
          userType: 'Admin'));
    } on FirebaseAuthException catch (e) {
      UtilMethod.customDialogBox(context, "Error", e.code);
      Logger().e(e);
    } catch (e) {
      Logger().e(e);
    }
  }

  //----------------------saving activityLog data in cloud firestore---------------------

  CollectionReference activityLog =
      FirebaseFirestore.instance.collection('activity_log');
  Future<void> saveActivityLog(
    BuildContext context,
    String adminName,
    String userName,
    String change,
    DateTime dateTime,
  ) async {
    try {
      String appoactivityLogId = activityLog.doc().id;

      return activityLog.add({
        'id': appoactivityLogId,
        'adminName': adminName,
        'userName': userName,
        'change': change,
        'dateTime': dateTime,
      }).then((value) {
        Logger().e("Activity Log Added");
        // ignore: invalid_return_type_for_catch_error
      }).catchError((error) => Logger().e("Failed to add Appointment: $error"));
    } catch (e) {
      Logger().e(e);
    }
  }

  //------------------------ GET All Admins ------------------------
  Stream<QuerySnapshot> getAdmins() => admins.snapshots();

  //------------------------ GET All activitylogs ------------------------
  Stream<QuerySnapshot> getAllActivityLog() => activityLog.snapshots();

  //-------------retrieve and listen to the admin real-time-----------------
  Stream<QuerySnapshot> getAdminAdditional() => additionalAdmin.snapshots();
}
