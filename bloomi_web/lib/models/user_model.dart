part of 'objects.dart';

@JsonSerializable()
class UserModel {
  String uid;
  String name;
  String email;
  String phone;
  String department;
  String faculty;
  String year;
  String userCredential;
  String userType;
  String imgUrl;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
    required this.department,
    required this.faculty,
    required this.year,
    required this.userCredential,
    required this.userType,
    required this.imgUrl,
  });

  // //-----------binding data from firestore to user model----------------
  // UserModel.fromJson(Map<String, dynamic> json)
  //     : uid = json['uid'],
  //       name = json['name'],
  //       email = json['email'],
  //       phone = json['phone'],
  //       department = json['department'],
  //       faculty = json['faculty'],
  //       year = json['year'],
  //       userCredential = json['userCredential'],
  //       userType = json['userType'],
  //       imgUrl = json['imgUrl'];

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
