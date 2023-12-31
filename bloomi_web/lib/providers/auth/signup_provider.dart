import 'package:bloomi_web/controllers/auth_controller.dart';
import 'package:bloomi_web/utils/util_method.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class SignupProvider extends ChangeNotifier {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _email = TextEditingController();
  String _department = "";
  String _faculty = "";
  String _year = "";

  final String _userType = "User";
  bool _isObscure = true;

  //-----------------Getters-----------------
  TextEditingController get name => _name;
  TextEditingController get password => _password;
  TextEditingController get phoneNumber => _phoneNumber;
  TextEditingController get email => _email;
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

  void setConformPassword(String conformPassword) {
    _phoneNumber.text = conformPassword;
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

  void setYear(String year) {
    _year = year;
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
      String email,
      String password,
      String name,
      String phone,
      String department,
      String faculty,
      String year,
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
        await AuthController().signUpUser(
          email,
          password,
          name,
          phone,
          department,
          faculty,
          year,
          "",
          userType,
          context,
        );

        setIsLoading(false);
      } else {
        UtilMethod.customDialogBox(
            context, "Error", "Please fill all the fields",
            onOkPressed: () {}, onCancelPressed: () {});
      }
      setIsLoading(false);
    } catch (e) {
      Logger().e(e);
      setIsLoading(false);
    }
  }
}
