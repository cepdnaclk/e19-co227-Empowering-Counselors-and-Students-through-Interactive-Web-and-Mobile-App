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
  ) async {
    try {
      //create Admin account with email and password
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        saveAdminData(AdminModel(
            uid: credential.user!.uid,
            name: name,
            email: email,
            phone: phone,
            credential: userCredential,
            userType: userType,
            imgUrl: ""));
      }

      if (credential.user != null) {
        saveUserAdditionalData(ChatModel(
            uid: credential.user!.uid,
            name: name,
            email: email,
            img: "",
            lastSeen: DateTime.now().toString(),
            isOnline: true,
            token: "",
            userType: userType));
      }

      Logger().i(credential.user);
    } on FirebaseAuthException catch (e) {
      UtilMethod.customDialogBox(context, "Error", e.code);
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

  //------------------------ GET All Admins ------------------------
  Stream<QuerySnapshot> getAdmins() => admins.snapshots();

  //-------------retrieve and listen to the admin real-time-----------------
  Stream<QuerySnapshot> getAdminAdditional() => admins.snapshots();
}
