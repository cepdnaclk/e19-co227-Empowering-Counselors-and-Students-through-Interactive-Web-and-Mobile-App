part of 'objects.dart';

@JsonSerializable(explicitToJson: true)
class CountModel {
  int date;
  int month;

  CountModel({
    required this.date,
    required this.month,
  });

  // //-----------binding data from firestore to user model----------------

  factory CountModel.fromJson(Map<String, dynamic> json) =>
      _$CountModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountModelToJson(this);
}
