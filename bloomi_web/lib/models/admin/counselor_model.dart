class CounselorModel{
  String uid;
  String name;
  String email;
  String phone;
  String faculty;
  String credentials;
  String userType;
  String imgUrl;

  CounselorModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
    required this.faculty,
    required this.credentials,
    required this.userType,
    required this.imgUrl,
  });

  //-----------binding data from firestore to user model----------------
  CounselorModel.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        name = json['name'],
        email = json['email'],
        phone = json['phone'],
        faculty = json['faculty'],
        credentials = json['credentials'],
        userType = json['userType'],
        imgUrl = json['imgUrl'];
}