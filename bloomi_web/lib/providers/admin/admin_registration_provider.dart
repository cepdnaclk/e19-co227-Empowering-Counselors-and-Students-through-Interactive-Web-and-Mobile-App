import 'package:bloomi_web/controllers/auth_controller.dart';
import 'package:bloomi_web/utils/util_method.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AdminRegistrationProvider extends ChangeNotifier {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _password = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _credentials = TextEditingController();
  String _department = "";
  String _faculty = "";
  String _year = "";

  final String _userType = "Admin";
  bool _isObscure = true;

  //-----------------Getters-----------------
  TextEditingController get name => _name;
  TextEditingController get password => _password;
  TextEditingController get phoneNumber => _phoneNumber;
  TextEditingController get email => _email;
  TextEditingController get credentials => _credentials;
  String get department => _department;
  String get faculty => _faculty;
  String get year => _year;
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

  void setDepartment(String department) {
    _department = department;
    notifyListeners();
  }

  void setFaculty(String faculty) {
    _faculty = faculty;
    notifyListeners();
  }

  void setPhoneNumber(String faculty) {
    _phoneNumber = phoneNumber;
    notifyListeners();
  }

  void setYear(String year) {
    _year = year;
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
  Future<void> signUpUser(
      String name,
      String email,
      String password,
      String phoneNumber,
      // String faculty,
      String credential,
      BuildContext context) async {
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          phoneNumber.isNotEmpty &&
          name.isNotEmpty &&
          // faculty.isNotEmpty &&
          credential.isNotEmpty) {
        setIsLoading(true);

        //sign up user
        await AuthController().signUpUser(
          email,
          password,
          name,
          phoneNumber,
          department,
          faculty,
          year,
          credential,
          userType,
          context,
        );

        setIsLoading(false);
      } else {
        Logger().i(email);
        Logger().i(password);
        Logger().i(name);
        Logger().i(faculty);
        Logger().i(phoneNumber);
        Logger().i(credential);

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
