part of 'objects.dart';

@JsonSerializable()
class CalenderModel {
  String eventName;
  DateTime date;
  DateTime time;
  bool isAllDay;
  String studentName;
  String studentEmail;

  CalenderModel({
    required this.eventName,
    required this.date,
    required this.time,
    required this.isAllDay,
    required this.studentName,
    required this.studentEmail,
  });

  factory CalenderModel.fromJson(Map<String, dynamic> json) =>
      _$CalenderModelFromJson(json);

  Map<String, dynamic> toJson() => _$CalenderModelToJson(this);
}
