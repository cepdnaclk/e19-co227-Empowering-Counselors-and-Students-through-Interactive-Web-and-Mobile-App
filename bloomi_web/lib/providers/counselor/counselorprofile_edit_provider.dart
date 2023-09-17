import 'package:bloomi_web/controllers/auth_controller.dart';
import 'package:bloomi_web/utils/util_method.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class CounselorProfileEditProvider extends ChangeNotifier {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _department = TextEditingController();
  final TextEditingController _faculty = TextEditingController();
  final TextEditingController _credentials = TextEditingController();

  final String _userType = "Counselor";

  //-----------------Getters-----------------
  TextEditingController get name => _name;
  TextEditingController get password => _password;
  TextEditingController get confirmPassword => _confirmPassword;
  TextEditingController get phoneNumber => _phoneNumber;
  TextEditingController get email => _email;
  TextEditingController get department => _department;
  TextEditingController get faculty => _faculty;
  TextEditingController get credentials => _credentials;

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

  void setConfirmPassword(String confirmPassword) {
    _confirmPassword.text = confirmPassword;
    notifyListeners();
  }

  void setEmail(String email) {
    _email.text = email;
    notifyListeners();
  }

  void setDepartment(String department) {
    _department.text = department;
    notifyListeners();
  }

  void setFaculty(String faculty) {
    _faculty.text = faculty;
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
  Future<void> counselorProfileEdit(
      String email,
      String password,
      String conformPassword,
      String name,
      String phone,
      String department,
      String faculty,
      String credentials,
      BuildContext context) async {
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          password == conformPassword &&
          phoneNumber.text.isNotEmpty &&
          name.isNotEmpty &&
          department.isNotEmpty &&
          faculty.isNotEmpty &&
          credentials.isNotEmpty) {
        setIsLoading(true);

        //add counselor
        await AuthController().counselorProfile(email, password, name, phone,
            department, faculty, credentials, userType, context);

        setIsLoading(false);
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
