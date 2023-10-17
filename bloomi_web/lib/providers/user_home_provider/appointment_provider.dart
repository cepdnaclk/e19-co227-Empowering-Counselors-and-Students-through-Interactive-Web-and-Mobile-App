import 'package:bloomi_web/controllers/appoinment_controller.dart';
import 'package:bloomi_web/models/objects.dart';
import 'package:bloomi_web/utils/util_method.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

//------------------------ APPOINTMENT PROVIDER ------------------------
class AppointmentProvider extends ChangeNotifier {
  //------------------------ TEXT EDITING CONTROLLER ------------------------
  final TextEditingController _name = TextEditingController();
  final TextEditingController _note = TextEditingController();
  DateTime _dateTime = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay.now();

  //------------------------ GETTERS ------------------------
  TextEditingController get name => _name;
  DateTime get getDateTime => _dateTime;
  TimeOfDay get getTimeOfDay => _timeOfDay;
  TextEditingController get note => _note;

  //------------------------ SETTERS ------------------------
  void setDateTime(DateTime dateTime) {
    _dateTime = dateTime;
    notifyListeners();
  }

  void setName(String name) {
    _name.text = name;
    notifyListeners();
  }

  void setTimeOfDay(TimeOfDay timeOfDay) {
    _timeOfDay = timeOfDay;
    notifyListeners();
  }

  void setNoteText(String note) {
    _note.text = note;
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

  //------------------------ SAVE APPOINTMENT ------------------------
  Future<void> saveAppointment(
      BuildContext context,
      String studentId,
      String counselorId,
      String studentName,
      String counselorName,
      String studentEmail,
      String studentFaculty,
      String date,
      String time,
      String status,
      String note) async {
    try {
      if (studentId.isNotEmpty &&
          counselorId.isNotEmpty &&
          studentName.isNotEmpty &&
          counselorName.isNotEmpty &&
          studentEmail.isNotEmpty &&
          studentFaculty.isNotEmpty &&
          date.isNotEmpty &&
          time.isNotEmpty &&
          status.isNotEmpty) {
        setIsLoading(true);
        await AppointmentController().saveAppoinments(
          context,
          studentId,
          counselorId,
          studentName,
          counselorName,
          studentEmail,
          studentFaculty,
          date,
          time,
          status,
          note,
        );
        notifyListeners();
        setIsLoading(false);
      } else {
        UtilMethod.customDialogBox(
          context,
          "Error",
          "Please fill all the fields",
          onOkPressed: () {},
          onCancelPressed: () {},
        );
        setIsLoading(false);
      }

      // Clear text fields after saving
      name.clear();

      setIsLoading(false);
    } catch (e) {
      Logger().e(e);
      setIsLoading(false);
    }
  }

  //-----------------------To fetch all appointments---------------------

  List<AppointmentModel>? _appointmentModels;

  List<AppointmentModel>? get appointmentModels => _appointmentModels;

  Future<List<AppointmentModel>?> fetchAllAppointments(String uid) async {
    try {
      List<AppointmentModel>? appointmentModels = await AppointmentController()
          .fetchAllAppointments(
              uid); // Assuming you have a method to fetch all appointments

      if (appointmentModels!.isNotEmpty) {
        _appointmentModels = appointmentModels;
        notifyListeners();

        return appointmentModels;
      } else {
        Logger().i("No appointments found");
        return null;
      }
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }
}
