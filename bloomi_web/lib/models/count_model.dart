part of 'objects.dart';

@JsonSerializable(explicitToJson: true)
class CountModel {
  String userCount;
  String counsellorCount;
  String adminCount;

  CountModel({
    required this.userCount,
    required this.counsellorCount,
    required this.adminCount,
  });

  // //-----------binding data from firestore to user model----------------

  factory CountModel.fromJson(Map<String, dynamic> json) =>
      _$CountModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountModelToJson(this);
}
