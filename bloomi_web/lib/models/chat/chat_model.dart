import 'package:json_annotation/json_annotation.dart';

part 'chat_model.g.dart';

@JsonSerializable()
class ChatUserModel {
  String uid;
  String name;
  String email;
  String img;
  String lastSeen;
  bool isOnline;

  @JsonKey(defaultValue: "")
  String token;

  ChatUserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.img,
    required this.lastSeen,
    required this.isOnline,
    required this.token,
  });

  factory ChatUserModel.fromJson(Map<String, dynamic> json) =>
      _$ChatUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatUserModelToJson(this);
}
