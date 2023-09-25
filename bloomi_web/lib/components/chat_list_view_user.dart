import 'package:bloomi_web/components/conservation_tile_users.dart';
import 'package:bloomi_web/controllers/chat_controller.dart';
import 'package:bloomi_web/models/objects.dart';
import 'package:bloomi_web/providers/user_home_provider/user_chat.dart';
import 'package:bloomi_web/providers/users/user_provider.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class ChatListViewUser extends StatefulWidget {
  const ChatListViewUser({
    super.key,
  });

  @override
  State<ChatListViewUser> createState() => _ChatListViewUserState();
}

class _ChatListViewUserState extends State<ChatListViewUser> {
  final List<ChatModel> _list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                        child: Text("No User Found Yet"),
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
                              child: ConversationTileUsers(
                                chatModel: _list[index],
                                index: index,
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
      ),
    );
  }
}
