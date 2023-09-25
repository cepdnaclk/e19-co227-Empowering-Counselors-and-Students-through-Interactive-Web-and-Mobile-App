import 'package:bloomi_web/controllers/auth_controller.dart';
import 'package:bloomi_web/models/objects.dart';
import 'package:bloomi_web/providers/user_home_provider/user_chat.dart';
import 'package:bloomi_web/screens/counsellor_screens/chat/conversation/conservation_tile_counsellor.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class ChatListViewCounsellor extends StatefulWidget {
  const ChatListViewCounsellor({
    super.key,
  });

  @override
  State<ChatListViewCounsellor> createState() => _ChatListViewCounsellorState();
}

class _ChatListViewCounsellorState extends State<ChatListViewCounsellor> {
  final List<ChatModel> _list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: UtilConstants.lightgreyColor,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
            child: StreamBuilder(
              stream: AuthController().getUsersAdditional(),
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
                    child: Text("No Student Found Yet"),
                  );
                }

                Logger().i(snapshot.data!.docs[0].data());

                //-------------clear the list before adding new data----------------
                _list.clear();

                //-----------------read the document list from snapshot and map to model and add to list----------------
                for (var e in snapshot.data!.docs) {
                  Map<String, dynamic> data = e.data() as Map<String, dynamic>;
                  var model = ChatModel.fromJson(data);
                  _list.add(model);
                  Logger().i(model.name);
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
                          child: ConversationTileCounsellor(
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
            )),
      ),
    );
  }
}
