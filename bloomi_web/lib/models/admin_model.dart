part of 'objects.dart';

@JsonSerializable()
class AdminModel {
  String uid;
  String name;
  String email;
  String phone;
  String credential;
  String userType;
  String imgUrl;

  AdminModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
    required this.userType,
    required this.imgUrl,
    required this.credential,
  });

  factory AdminModel.fromJson(Map<String, dynamic> json) =>
      _$AdminModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdminModelToJson(this);
}
