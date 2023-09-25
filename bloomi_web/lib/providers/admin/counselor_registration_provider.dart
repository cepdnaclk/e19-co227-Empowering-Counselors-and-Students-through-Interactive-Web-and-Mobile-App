// ignore_for_file: use_build_context_synchronously

import 'package:bloomi_web/controllers/chat_controller.dart';
import 'package:bloomi_web/controllers/counsellor_controller.dart';
import 'package:bloomi_web/models/objects.dart';
import 'package:bloomi_web/providers/user_home_provider/user_chat.dart';
import 'package:bloomi_web/screens/home_screens/chat/home/chat.dart';
import 'package:bloomi_web/utils/util_function.dart';
import 'package:bloomi_web/utils/util_method.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class CounsellorRegistrationProvider extends ChangeNotifier {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _credentials = TextEditingController();
  String _faculty = "";
  final String _userType = "Counselor";
  bool _isObscure = true;
  ConversationModel? _conversationModelNew;

  //-----------------Getters-----------------
  TextEditingController get name => _name;
  TextEditingController get password => _password;
  TextEditingController get phoneNumber => _phoneNumber;
  TextEditingController get email => _email;
  TextEditingController get credentials => _credentials;
  String get faculty => _faculty;
  bool get isObscure => _isObscure;
  String get userType => _userType;
  ConversationModel get getConversationModelNew => _conversationModelNew!;

  //-----------------Setters-----------------
  void setName(String name) {
    _name.text = name;
    notifyListeners();
  }

  void setPassword(String password) {
    _password.text = password;
    notifyListeners();
  }

  void setEmail(String email) {
    _email.text = email;
    notifyListeners();
  }

  void setFaculty(String faculty) {
    _faculty = faculty;
    notifyListeners();
  }

  void setCredentials(String credentials) {
    _credentials.text = credentials;
    notifyListeners();
  }

  void setPhoneNumber(String phoneNumber) {
    _phoneNumber.text = phoneNumber;
    notifyListeners();
  }

  // ------------------ User Chat index set------------------
  void changeConversationModelNew(ConversationModel conversationModel) {
    _conversationModelNew = conversationModel;
    notifyListeners();
  }

  void setIsObscure(bool isObscure) {
    if (isObscure == false) {
      _isObscure = !_isObscure;
      notifyListeners();
    } else {
      _isObscure = _isObscure;
      notifyListeners();
    }
  }

  bool _isLoading = false;

  //-----------------Getters-----------------
  bool get isLoading => _isLoading;

  //-----------------Setters-----------------
  void setIsLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

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

  //----------------------Functions---------------------
  Future<void> signUpCounsellor(
    String name,
    String email,
    String password,
    String phone,
    String faculty,
    String credential,
    BuildContext context,
  ) async {
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          phone.isNotEmpty &&
          name.isNotEmpty &&
          faculty.isNotEmpty &&
          credential.isNotEmpty) {
        setIsLoading(true);

        //sign up user
        await CounsellorController()
            .signUpCounsellor(
          email,
          password,
          name,
          phone,
          faculty,
          credential,
          userType,
          context,
        )
            .then((value) {
          UtilMethod.customDialogBox(
              context, "Success", "Counsellor Registered Successfully");
          _email.clear();
          _password.clear();
          _phoneNumber.clear();
          _name.clear();
          _credentials.clear();
        });

        setIsLoading(false);
      } else {
        UtilMethod.customDialogBox(
            context, "Error", "Please fill all the fields");
      }
      setIsLoading(false);
    } catch (e) {
      Logger().e(e);
      setIsLoading(false);
    }
  }

  //-----------------------To fetch counselor data---------------------

  CounsellorModel? _counsellorModel;

  CounsellorModel? get counsellorModel => _counsellorModel;
  Future<CounsellorModel?> startFetchCounsellorData(String uid) async {
    try {
      CounsellorModel? counsellorModel =
          await CounsellorController().fetchCounsellorData(uid);
      if (counsellorModel != null) {
        _counsellorModel = counsellorModel;
        notifyListeners();

        return counsellorModel;
      } else {
        Logger().i("User not found");
        return null;
      }
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }

  //-----------------------To fetch additional data---------------------

  ChatModel? _chatModel;

  ChatModel? get chatModel => _chatModel;
  Future<ChatModel?> startFetchCounsellorAdditionalData(String uid) async {
    try {
      ChatModel? chatModel =
          await CounsellorController().fetchCounsellorAdditionalData(uid);
      if (chatModel != null) {
        _chatModel = chatModel;
        notifyListeners();
        Logger().e(chatModel.lastSeen);
        return chatModel;
      } else {
        Logger().i("User not found");
        return null;
      }
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }

  //-----------------------To update current user online states---------------------
  void updateCounsellorOnlineState(bool val) {
    Logger().e(val);
    try {
      CounsellorController()
          .updateOnlineStateCounsellor(counsellorModel!.uid, val);
    } catch (e) {
      Logger().e(e);
    }
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
          Provider.of<CounsellorRegistrationProvider>(context, listen: false)
              .chatModel!;

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

  final ChatController _chatControllerModel = ChatController();
  //-------------------send message and save it in db-------------------
  Future<void> startSendMessage(BuildContext context, String msg) async {
    try {
      //-------------save msg in dp----------------
      ChatModel me =
          Provider.of<CounsellorRegistrationProvider>(context, listen: false)
              .chatModel!;

      await _chatControllerModel.sendMessage(
          Provider.of<UserChatProvider>(context, listen: false)
              .getConversationModelNew
              .id,
          me.name,
          me.uid,
          Provider.of<UserChatProvider>(context, listen: false)
              .getConversationModelNew
              .usersArray[1]
              .uid,
          msg);
    } catch (e) {
      Logger().e(e);
    }
  }
}
