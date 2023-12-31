// ignore_for_file: use_build_context_synchronously
import 'package:bloomi_web/models/objects.dart';
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
        saveUserData(UserModel(
                uid: credential.user!.uid,
                name: name,
                email: email,
                phone: phone,
                department: department,
                faculty: faculty,
                year: year,
                userCredential: userCredential,
                userType: userType,
                imgUrl: UtilConstants
                    .dummyProfileUrl) //save user data in cloud firestore
            );
      }

      if (credential.user != null) {
        saveUserAdditionalData(ChatModel(
          uid: credential.user!.uid,
          name: name,
          email: email,
          img: UtilConstants.dummyProfileUrl,
          lastSeen: DateTime.now().toString(),
          isOnline: true,
          token: "",
          userType: userType,
          month: DateTime.now().month,
          day: DateTime.now().day,
        ));
      }

      Logger().i(credential.user);
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

  //----------------------saving user data in cloud firestore---------------------
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> saveUserData(UserModel userModel) {
    return users
        .doc(userModel.uid)
        .set({
          'uid': userModel.uid,
          'name': userModel.name,
          'email': userModel.email,
          'phone': userModel.phone,
          'department': userModel.department,
          'faculty': userModel.faculty,
          'year': userModel.year,
          'userCredential': userModel.userCredential,
          'userType': userModel.userType,
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

      return user;
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }

  //----------------------saving user additional data in cloud firestore---------------------

  CollectionReference additionalUsers =
      FirebaseFirestore.instance.collection('additionalUsers');

  Future<void> saveUserAdditionalData(ChatModel chatModel) {
    return additionalUsers
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

  //-----------------------fetch user additional data from database---------------------
  Future<ChatModel?> fetchUserAdditionalData(String uid) async {
    try {
      //-------firebase quary to fetch user data from database--------
      DocumentSnapshot documentSnapshot = await additionalUsers.doc(uid).get();

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

  //-----------------------fetch user additional all data from database---------------------
  List<ChatModel>? allChatModel = [];

  List<ChatModel>? get chatModel => allChatModel;
  Future<List<ChatModel>?> fetchUserAdditionalAllData() async {
    try {
      allChatModel!.clear();
      //-------firebase quary to fetch user data from database--------
      QuerySnapshot querySnapshot = await additionalUsers.get();

      Logger().e(querySnapshot.docs.length);
      //-------mapping user data to user model--------
      for (var e in querySnapshot.docs) {
        ChatModel chats = ChatModel.fromJson(e.data() as Map<String, dynamic>);

        allChatModel!.add(chats);
      }

      return allChatModel;
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

  CollectionReference usersDataCount =
      FirebaseFirestore.instance.collection('usersDataCount');
  //-----------------------To SignIn user---------------------
  Future<bool> signInUser(
      String email, String password, BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      usersDataCount
          .add({
            'date': DateTime.now().day,
            'month': DateTime.now().month,
          })
          .then((value) => Logger().i("User Added"))
          .catchError((error) => Logger().e("Failed to add user: $error"));

      Logger().i(credential.user);

      return true;
    } on FirebaseAuthException catch (e) {
      Logger().e(e);
      // UtilMethod.customDialogBox(context, "Error", e.code);
      return false;
    } catch (e) {
      Logger().e(e);
      return false;
    }
  }

  //-----------------------To Reset Password---------------------
  static Future<void> resetPassword(String email, BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email).then(
          (value) => UtilMethodForgotPassword.customDialogBox(
              context, "Email sent", "Please check your email"));
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

  //-----------------------fetch user data from database---------------------
  List<UserModel>? allUser = [];

  List<UserModel>? get user => allUser;

  Future<List<UserModel>?> fetchAllUserData() async {
    try {
      //-------firebase quary to fetch admin data from database--------
      QuerySnapshot querySnapshot = await users.get();

      Logger().i(querySnapshot.docs.length);

      for (var e in querySnapshot.docs) {
        UserModel users = UserModel.fromJson(e.data() as Map<String, dynamic>);

        allUser!.add(users);
      }

      return allUser;
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }

  //-----------------------fetch count from database---------------------
  List<CountModel>? countModel = [];

  List<CountModel>? get count => countModel;

  Future<List<CountModel>?> fetchAllCount() async {
    try {
      //-------firebase quary to fetch admin data from database--------
      QuerySnapshot querySnapshot = await usersDataCount.get();

      Logger().i(querySnapshot.docs.length);

      for (var e in querySnapshot.docs) {
        CountModel count =
            CountModel.fromJson(e.data() as Map<String, dynamic>);

        countModel!.add(count);
      }

      return countModel;
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }

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
          await saveUserData(UserModel(
              uid: user.uid,
              name: user.displayName ?? "",
              email: user.email ?? "",
              phone: user.phoneNumber ?? "",
              department: "",
              faculty: "",
              year: "",
              userCredential: "",
              userType: "User",
              imgUrl: user.photoURL ?? ""));
        }
        Logger().i(user.displayName);
      }
    } catch (e) {
      Logger().e(e);
    }
    return null;
  }

  //-----------------------update the current online state and lastseen---------------------
  Future<void> updateOnlineState(String uid, bool isOnline) async {
    await additionalUsers
        .doc(uid)
        .update({
          'isOnline': isOnline,
          'lastSeen': DateTime.now().toString(),
        })
        .then((value) => Logger().i("online state updated"))
        .catchError((error) => Logger().e("Failed to update: $error"));
  }

  //------------------------ GET All users ------------------------
  Stream<QuerySnapshot> getUsers() => users.snapshots();

  //------------------------ GET All users aditional  ------------------------
  Stream<QuerySnapshot> getUsersAdditional() => additionalUsers.snapshots();
}
