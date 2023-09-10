import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AdminNavProvider extends ChangeNotifier {
  int _index = 0; // Use a private variable to store the index

  //------------------GETTERS--------------------
  int get getIndex => _index; // Return the private variable

  //------------------SETTERS--------------------
  void setIndex(int index) {
    _index = index; // Update the private variable
    notifyListeners();
    Logger().i(_index); // Log the updated index
  }
}
