part of 'objects.dart';

@JsonSerializable()
class NoteModel {
  String userId;
  String id;
  String title;
  String description;

  NoteModel({
    required this.id,
    required this.title,
    required this.description,
    required this.userId,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) =>
      _$NoteModelFromJson(json);

  Map<String, dynamic> toJson() => _$NoteModelToJson(this);
}
