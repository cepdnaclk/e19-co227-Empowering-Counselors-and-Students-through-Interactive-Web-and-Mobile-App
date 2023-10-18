part of 'objects.dart';

@JsonSerializable()
class ActivityLog {
  String adminName;
  String userName;
  String change;

  @JsonKey(fromJson: _dateTimeFromJson)
  DateTime dateTime;

  ActivityLog({
    required this.adminName,
    required this.userName,
    required this.change,
    required this.dateTime,
  });

  factory ActivityLog.fromJson(Map<String, dynamic> json) =>
      _$ActivityLogFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityLogToJson(this);

  static DateTime _dateTimeFromJson(Timestamp timestamp) => timestamp.toDate();
}
