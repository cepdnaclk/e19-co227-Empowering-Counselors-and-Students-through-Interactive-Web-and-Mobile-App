part of 'objects.dart';

@JsonSerializable()
class CounsellorModel {
  String uid;
  String name;
  String email;
  String phone;
  String faculty;
  String userCredential;
  String userType;
  String imgUrl;

  CounsellorModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
    required this.faculty,
    required this.userCredential,
    required this.userType,
    required this.imgUrl,
  });

  factory CounsellorModel.fromJson(Map<String, dynamic> json) =>
      _$CounsellorModelFromJson(json);

  Map<String, dynamic> toJson() => _$CounsellorModelToJson(this);
}
