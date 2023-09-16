import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class UserChatProvider extends ChangeNotifier {
  // ------------------ User Chat index------------------
  int _index = 0;

  // ------------------ User Chat index get------------------
  int get getIndex => _index;

  // ------------------ User Chat index set------------------
  void changeIndex(int index) {
    _index = index;
    notifyListeners();
    Logger().i(getIndex);
  }
}
