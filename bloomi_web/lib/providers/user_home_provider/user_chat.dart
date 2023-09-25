// ignore_for_file: use_build_context_synchronously

import 'package:bloomi_web/controllers/chat_controller.dart';
import 'package:bloomi_web/models/objects.dart';
import 'package:bloomi_web/providers/users/user_provider.dart';
import 'package:bloomi_web/screens/home_screens/chat/home/chat.dart';
import 'package:bloomi_web/utils/util_function.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class UserChatProvider extends ChangeNotifier {
  // ------------------ User Chat index------------------
  int _index = -1;

  ConversationModel? _conversationModelNew;

  // ------------------ User Chat index get------------------
  int get getIndex => _index;

  ConversationModel get getConversationModelNew => _conversationModelNew!;

  // ------------------ User Chat index set------------------
  void changeIndex(int index) {
    _index = index;
    notifyListeners();
  }

  // ------------------ User Chat index set------------------
  void changeConversationModelNew(ConversationModel conversationModel) {
    _conversationModelNew = conversationModel;
    notifyListeners();
  }

  //-------------------Start of create conversation-------------------

  //-------------create conversation loading index-----------------
  int _loadingIndex = -1;

  //-------------create conversation loading index get-----------------
  int get getLoadingIndex => _loadingIndex;

  //-------------create conversation loading index set-----------------
  void changeLoadingIndex(int index) {
    _loadingIndex = index;
    notifyListeners();
    Logger().i(getLoadingIndex);
  }

  //------------------converasation model-------------------
  ConversationModel? _conversationModel;

  //-------------converasation model get-----------------
  ConversationModel? get getConversationModel => _conversationModel;

  final ChatController _chatController = ChatController();
  Future<void> createConversation(
      BuildContext context, ChatModel peerUser, int loading) async {
    try {
      //-------------get the current user-----------------
      ChatModel me =
          Provider.of<UserProvider>(context, listen: false).chatModel!;

      changeLoadingIndex(loading);

      _conversationModel =
          await _chatController.createConversation(me, peerUser);

      notifyListeners();

      changeLoadingIndex(-1);

      Logger().i(_conversationModel!.id);
      //-------------navigate to the conversation screen-----------------
      UtilFunction.navigateBackward(context, const Chat());
    } catch (e) {
      Logger().e(e);
      changeLoadingIndex(-1);
    }
  }

  //-------------------send message and save it in db-------------------
  Future<void> startSendMessage(BuildContext context, String msg) async {
    try {
      //-------------save msg in dp----------------
      ChatModel me =
          Provider.of<UserProvider>(context, listen: false).chatModel!;

      await _chatController.sendMessage(_conversationModelNew!.id, me.name,
          me.uid, _conversationModelNew!.usersArray[1].uid, msg);
    } catch (e) {
      Logger().e(e);
    }
  }
}
