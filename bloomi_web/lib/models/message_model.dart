part of 'objects.dart';

@JsonSerializable(explicitToJson: true)
class MessageModel {
  String conId;
  String senderName;
  String senderId;
  String reciverId;
  String message;
  String messageTime;

  MessageModel({
    required this.conId,
    required this.senderName,
    required this.senderId,
    required this.reciverId,
    required this.message,
    required this.messageTime,
  });

  // //-----------binding data from firestore to user model----------------

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageModelToJson(this);
}
