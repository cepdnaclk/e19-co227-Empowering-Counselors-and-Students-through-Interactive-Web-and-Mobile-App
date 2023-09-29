// ignore_for_file: use_build_context_synchronously

import 'package:bloomi_web/controllers/auth_controller.dart';
import 'package:bloomi_web/providers/admin/admin_registration_provider.dart';
import 'package:bloomi_web/providers/admin/counselor_registration_provider.dart';
import 'package:bloomi_web/utils/util_method.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class LoginProvider extends ChangeNotifier {
  final TextEditingController _password = TextEditingController();
  final TextEditingController _email = TextEditingController();
  bool _isObscure = true;
  //------------------GETTERS--------------------
  TextEditingController get password => _password;
  TextEditingController get email => _email;
  bool get isObscure => _isObscure;

  //------------------SETTERS--------------------
  void setEmail(String email) {
    _email.text = email;
    notifyListeners();
  }

  void setPassword(String password) {
    _password.text = password;
    notifyListeners();
  }

  bool _isLoading = false;

  //-----------------Getters-----------------
  bool get isLoading => _isLoading;

  //-----------------Setters-----------------
  void setIsLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  void setIsObscure(bool isObscure) {
    if (isObscure == false) {
      _isObscure = !_isObscure;
      notifyListeners();
    } else {
      _isObscure = _isObscure;
      notifyListeners();
    }
  }

  //------------------Function--------------------
  Future<void> signInUser(
      String email, String password, BuildContext context) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        setIsLoading(true);
        // try {
        await AuthController.signInUser(email, password, context).then((value) {
          if (value == false) {
            checkUserExistence(email).then((value2) async {
              try {
                if (value2!['exists']) {
                  await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: email,
                    password: password,
                  )
                      .then((value) async {
                    try {
                      final userType = value2['userType'];
                      if (userType == 'admin') {
                        final uidPre = value2['uid'];
                        final userIdPreviousCollection = admins.doc(uidPre);
                        final adminAdditional = additionalAdmin.doc(uidPre);
                        final name = value2['name'];
                        final phoneNumber = value2['phoneNumber'];
                        final credential = value2['credential'];

                        await Provider.of<AdminRegistrationProvider>(context,
                                listen: false)
                            .signUpAdmin(
                          name,
                          email,
                          password,
                          phoneNumber,
                          credential,
                          context,
                          value.user!.uid,
                          true,
                        );

                        await userIdPreviousCollection.delete();
                        await adminAdditional.delete();
                      } else if (userType == 'counsellor') {
                        final uidPre = value2['uid'];
                        final userIdPreviousCollection =
                            counsellors.doc(uidPre);
                        final counsellorAdditional =
                            additionalCounsellor.doc(uidPre);
                        final name = value2['name'];
                        final phoneNumber = value2['phoneNumber'];
                        final faculty = value2['faculty'];
                        final credential = value2['credential'];

                        await Provider.of<CounsellorRegistrationProvider>(
                                context,
                                listen: false)
                            .signUpCounsellor(
                                name,
                                email,
                                password,
                                phoneNumber,
                                faculty,
                                credential,
                                context,
                                value.user!.uid,
                                true);
                        await userIdPreviousCollection.delete();
                        await counsellorAdditional.delete();
                      }
                    } catch (e) {
                      Logger().e(e);
                    }
                  });
                } else {
                  UtilMethod.customDialogBox(
                    context,
                    "Error",
                    "email not Exists",
                    onCancelPressed: () {},
                    onOkPressed: () {},
                  );
                }
              } catch (e) {
                UtilMethod.customDialogBox(
                  context,
                  "Error",
                  "Incorrect Password",
                  onCancelPressed: () {},
                  onOkPressed: () {},
                );
                Logger().e(e);
              }
            });
          } else {
            return;
          }
        });

        setIsLoading(false);
      } else {
        UtilMethod.customDialogBox(
          context,
          "Error",
          "Please fill all the fields",
          onCancelPressed: () {},
          onOkPressed: () {},
        );
        setIsLoading(false);
      }
    } catch (e) {
      Logger().e(e);
      setIsLoading(false);
    }
  }

  final admins = FirebaseFirestore.instance.collection('admins');
  final counsellors = FirebaseFirestore.instance.collection('counsellors');
  CollectionReference additionalCounsellor =
      FirebaseFirestore.instance.collection('additionalCounsellor');
  CollectionReference additionalAdmin =
      FirebaseFirestore.instance.collection('additionalAdmin');

  Future<Map<String, dynamic>?> checkUserExistence(String email) async {
    try {
      final adminQuery = await admins.where('email', isEqualTo: email).get();

      final counsellorQuery =
          await counsellors.where('email', isEqualTo: email).get();

      if (adminQuery.docs.isNotEmpty) {
        // User exists as an admin, return user type and existence status
        return {
          'exists': true,
          'userType': 'admin',
          'uid': adminQuery.docs[0].data()['uid'],
          'name': adminQuery.docs[0].data()['name'],
          'phoneNumber': adminQuery.docs[0].data()['phone'],
          'credential': adminQuery.docs[0].data()['credential'],
        };
      } else if (counsellorQuery.docs.isNotEmpty) {
        // User exists as a counsellor, return user type and existence status
        return {
          'exists': true,
          'userType': 'counsellor',
          'uid': counsellorQuery.docs[0].id,
          'faculty': counsellorQuery.docs[0].data()['faculty'],
          'name': counsellorQuery.docs[0].data()['name'],
          'phoneNumber': counsellorQuery.docs[0].data()['phone'],
          'credential': counsellorQuery.docs[0].data()['userCredential'],
        };
      } else {
        // User does not exist in either collection, return existence status only
        return {'exists': false};
      }
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }
}
