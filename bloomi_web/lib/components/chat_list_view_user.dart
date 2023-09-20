import 'package:bloomi_web/components/conversation_tile.dart';
import 'package:bloomi_web/controllers/chat_controller.dart';
import 'package:bloomi_web/models/objects.dart';
import 'package:bloomi_web/providers/user_home_provider/user_chat.dart';
import 'package:bloomi_web/providers/users/user_provider.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class ChatListViewUser extends StatelessWidget {
  ChatListViewUser({
    super.key,
    required this.height,
    required this.names,
    required this.messages,
    required this.timeList,
  });

  final double height;
  final List<String> names;
  final List<String> messages;
  final List<String> timeList;

  final List<ChatModel> _list = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: height - 152,
      color: UtilConstants.lightgreyColor,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
          child: Consumer<UserProvider>(
            builder: (context, value, child) {
              return StreamBuilder(
                stream: ChatController().getUsers(value.userModel!.uid),
                builder: (context, snapshot) {
                  //-------if the snapshot error occurs, show error message-------
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text("Something went wrong"),
                    );
                  }

                  //-------if the snapshot is waiting, show progress indicator-------
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text("No users found"),
                    );
                  }

                  Logger().i(snapshot.data!.docs.length);

                  //-------------clear the list before adding new data----------------
                  _list.clear();

                  //-----------------read the document list from snapshot and map to model and add to list----------------
                  for (var e in snapshot.data!.docs) {
                    Map<String, dynamic> data =
                        e.data() as Map<String, dynamic>;
                    var model = ChatModel.fromJson(data);
                    _list.add(model);
                  }

                  return ListView.separated(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: InkWell(
                            onTap: () {
                              Provider.of<UserChatProvider>(context,
                                      listen: false)
                                  .changeIndex(index);
                            },
                            child: ConversationTile(
                              chatModel: _list[index],
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
                      itemCount: _list.length);
                },
              );
            },
          )),
    );
  }
}
