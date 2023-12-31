import 'package:bloomi_web/components/chat_header_widget.dart';
import 'package:bloomi_web/components/custom_chat_bubble.dart';
import 'package:bloomi_web/components/messagetyping_widget.dart';
import 'package:bloomi_web/controllers/chat_controller.dart';
import 'package:bloomi_web/models/objects.dart';
import 'package:bloomi_web/providers/user_home_provider/user_chat.dart';
import 'package:bloomi_web/providers/users/user_provider.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class CustomChatScreen extends StatelessWidget {
  CustomChatScreen({
    super.key,
    required this.width,
    required this.height,
    required this.conId,
    required this.isMobile,
  });

  final double width;
  final double height;
  final String conId;
  final bool isMobile;

  final List<MessageModel> _list = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (isMobile == false) ? width * 0.55 : width,
      height: height,
      color: UtilConstants.lightgreyColor,
      child: Consumer<UserChatProvider>(
        builder: (context, value, child) {
          return Column(
            children: [
              const ChatHeaderWidget(),
              StreamBuilder(
                stream: ChatController().getMessages(conId),
                builder: (context, snapshot) {
                  //-------if the snapshot error occurs, show error message-------
                  if (snapshot.hasError) {
                    return const Text("Something went wrong");
                  }

                  //-------if the snapshot is waiting, show progress indicator-------
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.data!.docs.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        children: [
                          Container(
                            width: (isMobile == false) ? width * 0.65 : width,
                            height: height - 135,
                            color: UtilConstants.whiteColor,
                          ),
                          const MessageTypingWidget(),
                        ],
                      ),
                    );
                  }

                  Logger().i(snapshot.data!.docs.length);

                  //-------------clear the list before adding new data----------------
                  _list.clear();

                  //-----------------read the document list from snapshot and map to model and add to list----------------
                  for (var e in snapshot.data!.docs) {
                    Map<String, dynamic> data =
                        e.data() as Map<String, dynamic>;
                    var model = MessageModel.fromJson(data);
                    _list.add(model);
                  }

                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: (isMobile == false) ? width * 0.65 : width,
                      height: height - 70,
                      color: UtilConstants.whiteColor,
                      child: Column(
                        children: [
                          Expanded(
                              child: ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  reverse: true,
                                  itemBuilder: (context, index) {
                                    return Consumer<UserProvider>(
                                      builder: (context, value, child) {
                                        return ChatBubble(
                                          isSender: _list[index].senderId ==
                                              value.userModel!.uid,
                                          messageModel: _list[index],
                                        );
                                      },
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(height: 10);
                                  },
                                  itemCount: _list.length)),
                          const MessageTypingWidget(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
