// ignore_for_file: use_build_context_synchronously

import 'dart:html';

import 'package:bloomi_web/models/auth/counselor_model.dart';
import 'package:bloomi_web/models/auth/user_model.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:bloomi_web/utils/util_method.dart';
import 'package:bloomi_web/utils/util_method_forgot_password.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

class AuthController {
  //-----------------------To SignUp user---------------------
  Future<void> signUpUser(
    String email,
    String password,
    String name,
    String phone,
    String department,
    String faculty,
    String year,
    String userCredential,
    String userType,
    BuildContext context,
  ) async {
    try {
      //create user with email and password
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        saveUserData(
          credential.user!.uid,
          name,
          email,
          phone,
          department,
          faculty,
          year,
          userCredential,
          userType, //save user data in cloud firestore
        );
      }
      Logger().i(credential.user);
    } on FirebaseAuthException catch (e) {
      UtilMethod.customDialogBox(context, "Error", e.code);
      Logger().e(e);
    } catch (e) {
      Logger().e(e);
    }
  }

  //----------------------saving user data in cloud firestore---------------------
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> saveUserData(
      String uid,
      String name,
      String email,
      String phone,
      String department,
      String faculty,
      String year,
      String userCredential,
      String userType) {
    return users
        .doc(uid)
        .set({
          'uid': uid,
          'name': name,
          'email': email,
          'phone': phone,
          'department': department,
          'faculty': faculty,
          'year': year,
          'userCredential': userCredential,
          'userType': userType,
          'imgUrl': UtilConstants.dummyProfileUrl,
        })
        .then((value) => Logger().i("User Added"))
        .catchError((error) => Logger().e("Failed to add user: $error"));
  }

  //-----------------------fetch user data from database---------------------
  Future<UserModel?> fetchUserData(String uid) async {
    try {
      //-------firebase quary to fetch user data from database--------
      DocumentSnapshot documentSnapshot = await users.doc(uid).get();

      //-------mapping user data to user model--------
      UserModel user =
          UserModel.fromJson(documentSnapshot.data() as Map<String, dynamic>);

      Logger().i(user.email);

      return user;
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }

  //-----------------------To SignOut user---------------------
  static Future<void> signOutUser() async {
    try {
      //sign out user
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      Logger().e(e);
    } catch (e) {
      Logger().e(e);
    }
  }

  //-----------------------To SignIn user---------------------
  static Future<void> signInUser(
      String email, String password, BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Logger().i(credential.user);
    } on FirebaseAuthException catch (e) {
      Logger().e(e);
      UtilMethod.customDialogBox(context, "Error", e.code);
    } catch (e) {
      Logger().e(e);
    }
  }

  //-----------------------To Reset Password---------------------
  static Future<void> resetPassword(String email, BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email).then(
          (value) => UtilMethodForgotPassword.customDialogBox(
              context, "Email sent", "Please check your email"));
    } on FirebaseAuthException catch (e) {
      UtilMethod.customDialogBox(context, "Error", e.code);
      Logger().e(e);
    } catch (e) {
      Logger().e(e);
    }
  }

  //-----------------------To add Counselor Profile---------------------
  Future<void> counselorProfile(
    String email,
    String password,
    String name,
    String phone,
    String department,
    String faculty,
    String credentials,
    String userType,
    BuildContext context,
  ) async {
    try {
      //create user with email and password
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        //There is an eror with this code part
        saveUserData(
          credential.user!.uid,
          name,
          email,
          phone,
          department,
          faculty,
          credentials,
          userType, //save counselor data in cloud firestore
        );
      }
      Logger().i(credential.user);
    } on FirebaseAuthException catch (e) {
      UtilMethod.customDialogBox(context, "Error", e.code);
      Logger().e(e);
    } catch (e) {
      Logger().e(e);
    }
  }
}

//----------------------saving counselor data in cloud firestore---------------------
FirebaseFirestore firestore = FirebaseFirestore.instance;
CollectionReference counselors =
    FirebaseFirestore.instance.collection('counselors');

Future<void> saveCounselorData(
    String counselorid,
    String name,
    String email,
    String phone,
    String department,
    String faculty,
    String credentials,
    String userType) {
  return counselors
      .doc(counselorid)
      .set({
        'counselorid': counselorid,
        'name': name,
        'email': email,
        'phone': phone,
        'department': department,
        'faculty': faculty,
        'credentials': credentials,
        'userType': userType,
        'imgUrl': UtilConstants.dummyProfileUrl,
      })
      .then((value) => Logger().i("Counselor Added"))
      .catchError((error) => Logger().e("Failed to add counselor: $error"));
}

//-----------------------fetch counselor data from database---------------------

Future<CounselorModel?> fetchCounselorData(String counselorid) async {
  try {
    //-------firebase quary to fetch user data from database--------
    DocumentSnapshot documentSnapshot = await counselors.doc(counselorid).get();

    //-------mapping user data to user model--------
    CounselorModel counselor = CounselorModel.fromJson(
        documentSnapshot.data() as Map<String, dynamic>);

    Logger().i(counselor.email);

    return counselor;
  } catch (e) {
    Logger().e(e);
  //-----------------------To signin with google User---------------------

  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Sign in with Google
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential authResult =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Check if the user is new or existing
      final User? user = authResult.user;
      final bool isNewUser = authResult.additionalUserInfo!.isNewUser;

      if (user != null) {
        // If it's a new user, save their data to Firestore
        if (isNewUser) {
          await saveUserData(
              user.uid,
              user.displayName ??
                  "", // Google users usually have a display name
              user.email ?? "",
              user.phoneNumber ?? "",
              "",
              "", // You can add department, faculty, year, and userType here
              "", // Add faculty
              "", // Add year
              user.photoURL ?? "" // Add userType
              );
        }
        Logger().i(user.displayName);
      }
    } catch (e) {
      Logger().e(e);
    }
    return null;
  }
}
