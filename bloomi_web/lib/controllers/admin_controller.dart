import 'package:bloomi_web/models/admin/counselor_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

class AdminController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  //-----------------------fetch all user data from database---------------------
  Future<List<AllUserModel>> fetchAllUserData() async {
    try {
      QuerySnapshot querySnapshot = await users.get();
      Logger().i(querySnapshot.docs.length);

      //------temp list-------
      List<AllUserModel> list = [];

      for (var e in querySnapshot.docs) {
        //------mapping data to user model-------
        AllUserModel allUserModel =
            AllUserModel.fromJson(e.data() as Map<String, dynamic>);

        //------adding user model to list-------
        list.add(allUserModel);
      }
      return list;
    } catch (e) {
      Logger().e(e);

      return [];
    }
  }
}
