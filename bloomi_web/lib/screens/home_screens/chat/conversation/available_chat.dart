import 'package:bloomi_web/components/chat_list_view_user.dart';
import 'package:bloomi_web/components/conversation_tile.dart';
import 'package:bloomi_web/controllers/chat_controller.dart';
import 'package:bloomi_web/models/objects.dart';
import 'package:bloomi_web/providers/user_home_provider/user_chat.dart';
import 'package:bloomi_web/providers/users/user_provider.dart';
import 'package:bloomi_web/screens/home_screens/chat/conversation/chat_screen_mobile.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:bloomi_web/utils/util_function.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class AvailableChat extends StatelessWidget {
  AvailableChat({
    Key? key,
    required this.height,
    required this.width,
    required this.isMobile,
  }) : super(key: key);

  final double height;
  final double width;
  final bool isMobile;

  final List<ConversationModel> _list = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (isMobile == false) ? width * 0.45 : width,
      height: height,
      color: UtilConstants.lightgreyColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        child: Consumer<UserProvider>(
          builder: (context, value, child) {
            return StreamBuilder(
              stream: ChatController().getConversation(value.userModel!.uid),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text("Something went wrong"),
                  );
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text("No conversation found"),
                  );
                }

                Logger().i(snapshot.data!.docs.length);

                _list.clear();

                for (var e in snapshot.data!.docs) {
                  Map<String, dynamic> data = e.data() as Map<String, dynamic>;
                  var model = ConversationModel.fromJson(data);
                  _list.add(model);
                }

                return Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: InkWell(
                              onTap: () {
                                try {
                                  Provider.of<UserChatProvider>(context,
                                          listen: false)
                                      .changeIndex(index);
                                  Provider.of<UserChatProvider>(context,
                                          listen: false)
                                      .changeConversationModelNew(_list[index]);

                                  isMobile
                                      ? UtilFunction.navigateForward(
                                          context,
                                          ChatScreenMobile(
                                              widthFinal: width,
                                              heightFinal: height))
                                      : null;
                                } catch (e) {
                                  Logger().e(e);
                                }
                              },
                              child: ConversationTile(
                                conversationModel: _list[index],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: SizedBox(height: 2),
                          );
                        },
                        itemCount: _list.length,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return const ChatListViewUser();
                            },
                          ),
                        );
                      },
                      child: const Text("Available Counselors"),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
