part of 'objects.dart';

@JsonSerializable()
class AppointmentModel {
  String id;
  String studentId;
  String counselorId;
  String studentName;
  String counselorName;
  String studentEmail;
  String studentFaculty;
  String date;
  String time;
  String status;
  String note;

  AppointmentModel({
    required this.id,
    required this.studentId,
    required this.counselorId,
    required this.studentName,
    required this.counselorName,
    required this.studentEmail,
    required this.studentFaculty,
    required this.date,
    required this.time,
    required this.status,
    required this.note,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentModelToJson(this);
}
