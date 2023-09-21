// ignore_for_file: use_build_context_synchronously

import 'package:bloomi_web/controllers/chat_controller.dart';
import 'package:bloomi_web/models/objects.dart';
import 'package:bloomi_web/providers/users/user_provider.dart';
import 'package:bloomi_web/screens/home_screens/chat/conversation/conversation.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:bloomi_web/utils/util_function.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class UserChatProvider extends ChangeNotifier {
  // ------------------ User Chat index------------------
  int _index = -1;
  String name = "";
  String img = UtilConstants.dummyProfileUrl;
  bool isOnline = false;

  // ------------------ User Chat index get------------------
  int get getIndex => _index;

  String get getName => name;

  String get getImg => img;

  bool get getIsOnline => isOnline;

  // ------------------ User Chat index set------------------
  void changeIndex(int index) {
    _index = index;
    notifyListeners();
    Logger().i(getIndex);
  }

  void changeName(String name) {
    this.name = name;
    notifyListeners();
    Logger().i(getName);
  }

  void changeImg(String img) {
    this.img = img;
    notifyListeners();
    Logger().i(getImg);
  }

  void changeIsOnline(bool isOnline) {
    this.isOnline = isOnline;
    notifyListeners();
    Logger().i(getIsOnline);
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

      //-------------navigate to the conversation screen-----------------
      UtilFunction.navigateBackward(context, const Conversation());
    } catch (e) {
      Logger().e(e);
      changeLoadingIndex(-1);
    }
  }
}
