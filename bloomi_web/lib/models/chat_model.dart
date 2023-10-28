part of 'objects.dart';

@JsonSerializable()
class ChatModel {
  String uid;
  String name;
  String email;
  String img;
  String lastSeen;
  bool isOnline;
  int month;
  int day;

  @JsonKey(defaultValue: '')
  String token;
  String userType;

  ChatModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.img,
    required this.lastSeen,
    required this.isOnline,
    required this.token,
    required this.userType,
    required this.month,
    required this.day,
  });

  // //-----------binding data from firestore to user model----------------

  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatModelToJson(this);
}
