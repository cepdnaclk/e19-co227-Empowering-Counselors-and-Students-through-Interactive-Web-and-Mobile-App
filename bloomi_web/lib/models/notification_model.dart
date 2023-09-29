part of 'objects.dart';

@JsonSerializable()
class NotificationModel {
  String id;
  String studentId;
  String counselorId;
  String studentName;
  String counselorName;
  String date;
  String time;
  String status;

  NotificationModel({
    required this.id,
    required this.studentId,
    required this.counselorId,
    required this.studentName,
    required this.counselorName,
    required this.date,
    required this.time,
    required this.status,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}
