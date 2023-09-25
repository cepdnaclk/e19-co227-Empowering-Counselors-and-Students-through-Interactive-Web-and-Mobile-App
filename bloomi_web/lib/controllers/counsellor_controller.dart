// ignore_for_file: use_build_context_synchronously

import 'package:bloomi_web/models/objects.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:bloomi_web/utils/util_method.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class CounsellorController {
  //-----------------------To SignUp counsellor---------------------
  Future<void> signUpCounsellor(
    String email,
    String password,
    String name,
    String phone,
    String faculty,
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
        await saveCounsellorData(CounsellorModel(
            uid: credential.user!.uid,
            name: name,
            email: email,
            phone: phone,
            faculty: faculty,
            userCredential: userCredential,
            userType: userType,
            imgUrl: ""));
      }

      if (credential.user != null) {
        await saveUserAdditionalData(ChatModel(
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

  //----------------------saving Counsellor data in cloud firestore---------------------
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference counsellor =
      FirebaseFirestore.instance.collection('counsellors');

  Future<void> saveCounsellorData(CounsellorModel counsellorModel) {
    return counsellor
        .doc(counsellorModel.uid)
        .set({
          'uid': counsellorModel.uid,
          'name': counsellorModel.name,
          'email': counsellorModel.email,
          'phone': counsellorModel.phone,
          'faculty': counsellorModel.faculty,
          'userCredential': counsellorModel.userCredential,
          'userType': counsellorModel.userType,
          'imgUrl': UtilConstants.dummyProfileUrl,
        })
        .then((value) => Logger().i("User Added"))
        .catchError((error) => Logger().e("Failed to add user: $error"));
  }

  //-----------------------fetch admin data from database---------------------
  Future<CounsellorModel?> fetchCounsellorData(String counsellorId) async {
    try {
      //-------firebase quary to fetch admin data from database--------
      DocumentSnapshot documentSnapshot =
          await counsellor.doc(counsellorId).get();

      //-------mapping admin data to admin model--------
      CounsellorModel counsellorModel = CounsellorModel.fromJson(
          documentSnapshot.data() as Map<String, dynamic>);

      return counsellorModel;
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }

  //----------------------saving admin additional data in cloud firestore---------------------

  CollectionReference additionalCounsellor =
      FirebaseFirestore.instance.collection('additionalCounsellor');

  Future<void> saveUserAdditionalData(ChatModel chatModel) {
    return additionalCounsellor
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

  //------------------------ GET All Counselors ------------------------
  Stream<QuerySnapshot> getCounsellors() => counsellor.snapshots();
}
