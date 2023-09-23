import 'package:flutter/material.dart';

//------------------------ APPOINTMENT PROVIDER ------------------------
class AppointmentProvider extends ChangeNotifier {
  //------------------------ TEXT EDITING CONTROLLER ------------------------
  final TextEditingController _name = TextEditingController();
  DateTime _dateTime = DateTime.now();

  //------------------------ GETTERS ------------------------
  TextEditingController get name => _name;
  DateTime get getDateTime => _dateTime;

  //------------------------ SETTERS ------------------------
  void setDateTime(DateTime dateTime) {
    _dateTime = dateTime;
    notifyListeners();
  }

  void setName(String name) {
    _name.text = name;
    notifyListeners();
  }
}
