part of 'objects.dart';

@JsonSerializable(explicitToJson: true)
class ConversationModel {
  String id;
  List<String> users;
  List<ChatModel> usersArray;
  String lastMessage;
  String lastMessageTime;
  String createdBy;

  ConversationModel({
    required this.id,
    required this.users,
    required this.usersArray,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.createdBy,
  });

  // //-----------binding data from firestore to user model----------------

  factory ConversationModel.fromJson(Map<String, dynamic> json) =>
      _$ConversationModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConversationModelToJson(this);
}
