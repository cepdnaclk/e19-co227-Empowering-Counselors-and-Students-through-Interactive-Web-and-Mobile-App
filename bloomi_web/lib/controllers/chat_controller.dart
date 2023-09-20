import 'package:cloud_firestore/cloud_firestore.dart';

class ChatController {
  CollectionReference additionalUsers =
      FirebaseFirestore.instance.collection('additionalUsers');

  //-------------retrive and listen to the user real time-----------------
  Stream<QuerySnapshot> getUsers(String currentUserId) =>
      additionalUsers.where("uid", isNotEqualTo: currentUserId).snapshots();
}
