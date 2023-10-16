import 'package:bloomi_web/components/conversation_image.dart';
import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/models/objects.dart';
import 'package:bloomi_web/providers/admin/counselor_registration_provider.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:bloomi_web/utils/util_function.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConversationTileCoun extends StatelessWidget {
  const ConversationTileCoun({
    super.key,
    required this.conversationModel,
  });

  final ConversationModel conversationModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
        color: UtilConstants.whiteColor,
      ),
      child: Consumer<CounsellorRegistrationProvider>(
        builder: (context, value, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ConversationImage(
                    imagePath: conversationModel.usersArray
                        .firstWhere((e) => e.uid != value.counsellorModel!.uid)
                        .img,
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomText(
                            conversationModel.usersArray
                                .firstWhere(
                                    (e) => e.uid != value.counsellorModel!.uid)
                                .name,
                            fontSize: 18,
                            fontColor: UtilConstants.blackColor,
                          ),
                        ],
                      ),
                      CustomText(
                        conversationModel.lastMessage,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontColor: UtilConstants.blackColor.withOpacity(0.5),
                      ),
                    ],
                  ),
                ],
              ),
              CustomText(
                UtilFunction.getTimeAgo(conversationModel.lastMessageTime),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontColor: UtilConstants.blackColor.withOpacity(0.5),
              ),
            ],
          );
        },
      ),
    );
  }
}
