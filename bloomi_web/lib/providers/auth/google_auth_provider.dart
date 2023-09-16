import 'package:bloomi_web/controllers/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class GoogleAuthProviders extends ChangeNotifier {
  final AuthController _authController = AuthController();

  //---------------firebase user------------------
  User? _firebaseUser;

  //---------------firebase user getter------------------
  User? get firebaseUser => _firebaseUser;

  //------------------google auth--------------------
  Future<void> googleAuth() async {
    try {
      final userCredential = await _authController.signInWithGoogle();

      if (userCredential != null) {
        Logger().i(userCredential.user!.displayName);
        _firebaseUser = userCredential.user;
        notifyListeners();
      } else {
        // Handle the case where userCredential is null (e.g., show an error message).
        Logger().e('signInWithGoogle returned null userCredential');
      }
    } catch (e) {
      // Handle other exceptions that may occur during authentication.
      Logger().e('Error during Google authentication: $e');
    }
  }
}
