import 'package:bloomi_web/controllers/chat_controller.dart';
import 'package:bloomi_web/models/objects.dart';
import 'package:bloomi_web/providers/admin/counselor_registration_provider.dart';
import 'package:bloomi_web/providers/user_home_provider/user_chat.dart';
import 'package:bloomi_web/screens/counsellor_screens/chat/conversation/chat_list_view_counsellor.dart';
import 'package:bloomi_web/screens/counsellor_screens/chat/conversation/conversation_tile_coun.dart';
import 'package:bloomi_web/screens/counsellor_screens/chat/conversation/custom_chat_view.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:bloomi_web/utils/util_function.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class AvailableChatCounsellor extends StatelessWidget {
  AvailableChatCounsellor({
    super.key,
    required this.height,
    required this.width,
    required this.isMobile,
  });

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
          child: Consumer<CounsellorRegistrationProvider>(
            builder: (context, value, child) {
              return StreamBuilder(
                stream: ChatController()
                    .getConversationCounsellor(value.counsellorModel!.uid),
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
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Center(
                          child: Text("No conversation found"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return const ChatListViewCounsellor();
                                },
                              ),
                            );
                          },
                          child: const Text("Available Users"),
                        ),
                      ],
                    );
                  }

                  Logger().i(snapshot.data!.docs.length);

                  //-------------clear the list before adding new data----------------
                  _list.clear();

                  //-----------------read the document list from snapshot and map to model and add to list----------------
                  for (var e in snapshot.data!.docs) {
                    Map<String, dynamic> data =
                        e.data() as Map<String, dynamic>;
                    var model = ConversationModel.fromJson(data);
                    _list.add(model);
                  }

                  return Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: InkWell(
                                  onTap: () {
                                    try {
                                      Provider.of<UserChatProvider>(context,
                                              listen: false)
                                          .changeIndex(index);
                                      Provider.of<UserChatProvider>(context,
                                              listen: false)
                                          .changeConversationModelNew(
                                              _list[index]);
                                      isMobile
                                          ? UtilFunction.navigateForward(
                                              context,
                                              CustomChatView(
                                                  width: width, height: height))
                                          : null;
                                    } catch (e) {
                                      Logger().e(e);
                                    }
                                  },
                                  child: ConversationTileCoun(
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
                            itemCount: _list.length),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return const ChatListViewCounsellor();
                              },
                            ),
                          );
                        },
                        child: const Text("Available Users"),
                      ),
                    ],
                  );
                },
              );
            },
          )),
    );
  }
}
