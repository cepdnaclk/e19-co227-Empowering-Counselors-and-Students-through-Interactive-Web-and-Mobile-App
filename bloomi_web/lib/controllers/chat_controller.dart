import 'package:bloomi_web/models/objects.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

class ChatController {
  CollectionReference additionalUsers =
      FirebaseFirestore.instance.collection('additionalUsers');

  //-------------retrieve and listen to the user real-time-----------------
  Stream<QuerySnapshot> getUsers(String currentUserId) =>
      additionalUsers.where("uid", isNotEqualTo: currentUserId).snapshots();

  //-------------Create conversation-----------------
  CollectionReference conversations =
      FirebaseFirestore.instance.collection('conversations');

  //-------------create conversation on the db-----------------
  Future<ConversationModel?> createConversation(
      ChatModel me, ChatModel peerUser) async {
    // Check if the conversation already exists
    ConversationModel? conversationModel =
        await checkConversationExists(me.uid, peerUser.uid);

    if (conversationModel == null) {
      // Conversation does not exist, create a new one
      try {
        // Get a unique id for the conversation
        String conversationId = conversations.doc().id;

        await conversations.doc(conversationId).set({
          'id': conversationId,
          'users': [me.uid, peerUser.uid],
          'usersArray': [me.toJson(), peerUser.toJson()],
          'lastMessage': "start a conversation",
          'lastMessageTime': DateTime.now().toString(),
          'createdBy': me.uid,
          'createdAt': DateTime.now(),
        });

        DocumentSnapshot documentSnapshot =
            await conversations.doc(conversationId).get();

        return ConversationModel.fromJson(
            documentSnapshot.data() as Map<String, dynamic>);
      } catch (error) {
        Logger().e("Failed to add conversation: $error");
        return null; // Handle the error gracefully by returning null
      }
    } else {
      // Conversation already exists, return it
      return conversationModel;
    }
  }

  //-------------check if the creating conversation exists on the db-----------------
  Future<ConversationModel?> checkConversationExists(
      String myId, String peerId) async {
    try {
      QuerySnapshot result = await conversations
          .where('users', arrayContainsAny: [myId, peerId]).get();

      Logger().w(result.docs.length);

      // If the conversation exists, return it
      for (var e in result.docs) {
        var model =
            ConversationModel.fromJson(e.data() as Map<String, dynamic>);

        if (model.users.contains(myId) && model.users.contains(peerId)) {
          Logger().w("Conversation already exists");
          return model;
        }
      }

      // If no matching conversation is found, return null
      return null;
    } catch (e) {
      Logger().e(e);
      return null; // Handle the error gracefully by returning null
    }
  }

  //-------------retrieve and listen to the conversation real-time-----------------
  Stream<QuerySnapshot> getConversation(String currentUserId) => conversations
      .orderBy('createdAt', descending: true)
      .where('users', arrayContainsAny: [currentUserId]).snapshots();
}
