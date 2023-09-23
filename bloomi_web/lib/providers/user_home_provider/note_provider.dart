import 'package:bloomi_web/controllers/note_controller.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

//------------------------ NOTE PROVIDER ------------------------
class NoteProvider extends ChangeNotifier {
  //------------------------ TEXT EDITING CONTROLLER ------------------------
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  bool isTrue = false;

  //------------------------ GETTERS ------------------------
  TextEditingController get getTitleController => titleController;
  TextEditingController get getDescriptionController => descriptionController;
  bool get getIsTrue => isTrue;

  //------------------------ SETTERS ------------------------
  void setTitleController(String title) {
    titleController.text = title;
    notifyListeners();
  }

  void setIstrue(bool istrue) {
    isTrue = istrue;
    notifyListeners();
  }

  void setDescriptionController(String description) {
    descriptionController.text = description;
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

  //------------------------ SAVE NOTE ------------------------
  Future<void> saveNote(
      String title, String description, BuildContext context) async {
    try {
      setIsLoading(true);
      await NoteController().saveNotes(
        title,
        description,
        context,
      );

      // Clear text fields after saving
      titleController.clear();
      descriptionController.clear();

      notifyListeners();
      setIsLoading(false);
    } catch (e) {
      Logger().e(e);
      setIsLoading(false);
    }
  }
}
