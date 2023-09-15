import 'package:bloomi_web/controllers/auth_controller.dart';
import 'package:bloomi_web/utils/util_method.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class CounselorRegistrationProvider extends ChangeNotifier {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _department = TextEditingController();
  final TextEditingController _faculty = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _credentials = TextEditingController();
  final String _userType = "Counselors";

  //-----------------Getters-----------------
  TextEditingController get name => _name;
  TextEditingController get password => _password;
  TextEditingController get phoneNumber => _phoneNumber;
  TextEditingController get email => _email;
  TextEditingController get department => _department;
  TextEditingController get faculty => _faculty;
  TextEditingController get username => _username;
  TextEditingController get credentials => _credentials;

  String get userType => _userType;

  //-----------------Setters-----------------
  void setName(String name) {
    _name.text = name;
    notifyListeners();
  }

  void setEmail(String email) {
    _email.text = email;
    notifyListeners();
  }

  void setConformPassword(String phoneNumber) {
    _phoneNumber.text = phoneNumber;
    notifyListeners();
  }

  void setPassword(String password) {
    _password.text = password;
    notifyListeners();
  }

  void setFaculty(String faculty) {
    _faculty.text = faculty;
    notifyListeners();
  }

  void setDepartment(String department) {
    _department.text = department;
    notifyListeners();
  }

  void setUserName(String username) {
    _username.text = username;
    notifyListeners();
  }

  void setCredentials(String credentials) {
    _credentials.text = credentials;
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

  //----------------------Functions---------------------
  Future<void> signUpUser(
      String email,
      String password,
      String name,
      String phone,
      String department,
      String faculty,
      String year,
      MediaQueryData mediaQueryData,
      BuildContext context) async {
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          phoneNumber.text.isNotEmpty &&
          name.isNotEmpty &&
          department.isNotEmpty &&
          faculty.isNotEmpty &&
          year.isNotEmpty) {
        setIsLoading(true);

        //sign up user
        await AuthController().signUpUser(email, password, name, phone,
            department, faculty, year, userType, context, mediaQueryData);

        setIsLoading(false);
      } else {
        UtilMethod.customDialogBox(
            mediaQueryData, context, "Error", "Please fill all the fields");
      }
      setIsLoading(false);
    } catch (e) {
      Logger().e(e);
      setIsLoading(false);
    }
  }
}
