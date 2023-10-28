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
    String uId,
    bool isTrue,
  ) async {
    try {
      if (isTrue == false) {
        String id = counsellor.doc().id;
        await saveCounsellorData(CounsellorModel(
            uid: id,
            name: name,
            email: email,
            phone: phone,
            faculty: faculty,
            userCredential: userCredential,
            userType: userType,
            imgUrl: ""));

        await saveUserAdditionalData(ChatModel(
          uid: id,
          name: name,
          email: email,
          img: "",
          lastSeen: DateTime.now().toString(),
          isOnline: true,
          token: "",
          userType: userType,
          month: DateTime.now().month,
          day: DateTime.now().day,
        ));
      } else {
        await saveCounsellorData(CounsellorModel(
            uid: uId,
            name: name,
            email: email,
            phone: phone,
            faculty: faculty,
            userCredential: userCredential,
            userType: userType,
            imgUrl: ""));

        await saveUserAdditionalData(ChatModel(
          uid: uId,
          name: name,
          email: email,
          img: "",
          lastSeen: DateTime.now().toString(),
          isOnline: true,
          token: "",
          userType: userType,
          month: DateTime.now().month,
          day: DateTime.now().day,
        ));
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
          'imgUrl': counsellorModel.imgUrl,
        })
        .then((value) => Logger().i("User Added"))
        .catchError((error) => Logger().e("Failed to add user: $error"));
  }

  //----------------------Update Counsellor data in cloud firestore---------------------
  Future<void> updateCounsellorData(CounsellorModel counsellorModel) {
    return counsellor
        .doc(counsellorModel.uid)
        .update({
          'uid': counsellorModel.uid,
          'name': counsellorModel.name,
          'email': counsellorModel.email,
          'phone': counsellorModel.phone,
          'faculty': counsellorModel.faculty,
          'userCredential': counsellorModel.userCredential,
          'userType': counsellorModel.userType,
          'imgUrl': counsellorModel.imgUrl,
        })
        .then((value) => Logger().i("User Updated"))
        .catchError((error) => Logger().e("Failed to update user: $error"));
  }

  //----------------------delete Counsellor data in cloud firestore---------------------
  Future<void> deleteCounsellorData(String uId) {
    return counsellor
        .doc(uId)
        .delete()
        .then((value) => Logger().i("User Deleted"))
        .catchError((error) => Logger().e("Failed to Delete user: $error"));
  }

  //-----------------------fetch counsellor data from database---------------------
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

  //-----------------------fetch counsellor all data from database---------------------
  List<CounsellorModel>? allCounsellor = [];

  List<CounsellorModel>? get counsellors => allCounsellor;

  Future<List<CounsellorModel>?> fetchAllCounsellorData() async {
    try {
      //-------firebase quary to fetch admin data from database--------
      QuerySnapshot querySnapshot = await counsellor.get();

      Logger().i(querySnapshot.docs.length);

      for (var e in querySnapshot.docs) {
        CounsellorModel counsellor =
            CounsellorModel.fromJson(e.data() as Map<String, dynamic>);

        allCounsellor!.add(counsellor);
      }

      return allCounsellor;
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }

  //-----------------------fetch user additional data from database---------------------
  Future<ChatModel?> fetchCounsellorAdditionalData(String uid) async {
    try {
      //-------firebase quary to fetch user data from database--------
      DocumentSnapshot documentSnapshot =
          await additionalCounsellor.doc(uid).get();

      Logger().e(documentSnapshot.data());
      //-------mapping user data to user model--------
      ChatModel chatModel =
          ChatModel.fromJson(documentSnapshot.data() as Map<String, dynamic>);

      Logger().e(chatModel.isOnline);

      return chatModel;
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
          'month': chatModel.month,
          'day': chatModel.day,
        })
        .then((value) => Logger().i("User Added"))
        .catchError((error) => Logger().e("Failed to add user: $error"));
  }

  //-----------------------update the current online state and lastseen---------------------
  Future<void> updateOnlineStateCounsellor(String uid, bool isOnline) async {
    await additionalCounsellor
        .doc(uid)
        .update({
          'isOnline': isOnline,
          'lastSeen': DateTime.now().toString(),
        })
        .then((value) => Logger().i("online state updated"))
        .catchError((error) => Logger().e("Failed to update: $error"));
  }

  //------------------------ GET All Counselors ------------------------
  Stream<QuerySnapshot> getCounsellors() => counsellor.snapshots();

  //-------------retrieve and listen to the counselor real-time-----------------
  Stream<QuerySnapshot> getCounselorsAdditional() =>
      additionalCounsellor.snapshots();
}
