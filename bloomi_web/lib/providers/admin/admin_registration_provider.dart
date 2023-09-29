import 'package:bloomi_web/controllers/admin_controller.dart';
import 'package:bloomi_web/models/objects.dart';
import 'package:bloomi_web/utils/util_method.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AdminRegistrationProvider extends ChangeNotifier {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _credentials = TextEditingController();

  final String _userType = "Admin";
  bool _isObscure = true;

  //-----------------Getters-----------------
  TextEditingController get name => _name;
  TextEditingController get password => _password;
  TextEditingController get phoneNumber => _phoneNumber;
  TextEditingController get email => _email;
  TextEditingController get credentials => _credentials;
  bool get isObscure => _isObscure;
  String get userType => _userType;

  //-----------------Setters-----------------
  void setName(String name) {
    _name.text = name;
    notifyListeners();
  }

  void setPassword(String password) {
    _password.text = password;
    notifyListeners();
  }

  void setEmail(String email) {
    _email.text = email;
    notifyListeners();
  }

  void setPhoneNumber(String phoneNumber) {
    _phoneNumber.text = phoneNumber;
    notifyListeners();
  }

  void setCredentials(String credentials) {
    _credentials.text = credentials;
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

  bool _isLoading = false;

  //-----------------Getters-----------------
  bool get isLoading => _isLoading;

  //-----------------Setters-----------------
  void setIsLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  //----------------------Functions---------------------
  Future<void> signUpAdmin(
      String name,
      String email,
      String password,
      String phoneNumber,
      String credential,
      BuildContext context,
      String uId,
      bool isTrue) async {
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          phoneNumber.isNotEmpty &&
          name.isNotEmpty &&
          credential.isNotEmpty) {
        if (phoneNumber.length == 10 && phoneNumber.startsWith('07')) {
          setIsLoading(true);

          Logger().e("User not found");
          //sign up user
          await AdminController()
              .signUpAdmin(
            email,
            password,
            name,
            phoneNumber,
            credential,
            userType,
            context,
            uId,
            isTrue,
          )
              .then((value) {
            UtilMethod.customDialogBox(
                context, "Success", "Registered Successfully!");
            _email.clear();
            _password.clear();
            _phoneNumber.clear();
            _name.clear();
            _credentials.clear();
          });

          setIsLoading(false);
        } else {
          UtilMethod.customDialogBox(
              context, "Error", "Please enter a valid Phone Number");
        }
      } else {
        UtilMethod.customDialogBox(
            context, "Error", "Please fill all the fields");
      }
      setIsLoading(false);
    } catch (e) {
      Logger().e(e);
      setIsLoading(false);
    }
  }

  //-----------------------To fetch admin data---------------------

  AdminModel? _adminModel;

  AdminModel? get adminModel => _adminModel;
  Future<AdminModel?> startFetchAdminData(String uid) async {
    try {
      AdminModel? adminModel = await AdminController().fetchAdminData(uid);
      if (adminModel != null) {
        _adminModel = adminModel;
        notifyListeners();

        return adminModel;
      } else {
        Logger().i("User not found");
        return null;
      }
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }

  //----------------------Functions for update---------------------
  Future<void> updateAdmin(
    String uid,
    String name,
    String email,
    String password,
    String phoneNumber,
    String credential,
    BuildContext context,
  ) async {
    try {
      if (uid.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          phoneNumber.isNotEmpty &&
          name.isNotEmpty &&
          credential.isNotEmpty) {
        if (phoneNumber.length == 10 && phoneNumber.startsWith('07')) {
          setIsLoading(true);

          await AdminController()
              .updateAdmin(
            email,
            password,
            name,
            phoneNumber,
            credential,
            userType,
            context,
            uid,
          )
              .then((value) {
            UtilMethod.customDialogBox(
                context, "Success", "Registered Successfully!");
            _email.clear();
            _password.clear();
            _phoneNumber.clear();
            _name.clear();
            _credentials.clear();
          });

          setIsLoading(false);
        } else {
          UtilMethod.customDialogBox(
              context, "Error", "Please enter a valid Phone Number");
        }
      } else {
        UtilMethod.customDialogBox(
            context, "Error", "Please fill all the fields");
      }
      setIsLoading(false);
    } catch (e) {
      Logger().e(e);
      setIsLoading(false);
    }
  }
}
