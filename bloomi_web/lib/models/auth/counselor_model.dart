class CounselorModel {
  String counselorid;
  String name;
  String email;
  String phone;
  String department;
  String faculty;
  String credentials;
  String userType;
  String imgUrl;

  CounselorModel({
    required this.counselorid,
    required this.name,
    required this.email,
    required this.phone,
    required this.department,
    required this.faculty,
    required this.credentials,
    required this.userType,
    required this.imgUrl,
  });

  //-----------binding data from firestore to Counselor model----------------
  CounselorModel.fromJson(Map<String, dynamic> json)
      : counselorid = json['counselorid'],
        name = json['name'],
        email = json['email'],
        phone = json['phone'],
        department = json['department'],
        faculty = json['faculty'],
        credentials = json['credentials'],
        userType = json['userType'],
        imgUrl = json['imgUrl'];
}
