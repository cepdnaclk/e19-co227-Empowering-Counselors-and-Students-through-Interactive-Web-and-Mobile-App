import 'package:bloomi_web/components/conversation_image.dart';
import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/providers/admin/counselor_registration_provider.dart';
import 'package:bloomi_web/screens/counsellor_screens/chat/conversation/chat_list_view_counsellor.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:bloomi_web/utils/util_function.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeaderWidgetCounsellor extends StatelessWidget {
  const HeaderWidgetCounsellor({
    super.key,
    this.isTrue = true,
  });

  final bool isTrue;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      width: width,
      height: 70,
      color: UtilConstants.tropicalBlurColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Consumer<CounsellorRegistrationProvider>(
            builder: (context, value, child) {
              return Row(
                children: [
                  ConversationImage(
                      //--------------here i have checked user type and acording to that assign details to the header----------------
                      imagePath: value.counsellorModel!.imgUrl),
                  const SizedBox(width: 20),
                  CustomText(
                    value.counsellorModel!.name,
                    fontSize: 20,
                    fontColor: UtilConstants.blackColor,
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.circle_rounded,
                    color: UtilConstants.greenColor,
                    size: 10,
                  )
                ],
              );
            },
          ),
          isTrue
              ? Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.call,
                        color: UtilConstants.blackColor,
                        size: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.video_call_rounded,
                        color: UtilConstants.blackColor,
                        size: 40,
                      ),
                    ),
                  ],
                )
              : IconButton(
                  onPressed: () {
                    UtilFunction.navigateForward(
                        context, const ChatListViewCounsellor());
                  },
                  icon: const Icon(
                    Icons.people_alt_rounded,
                    color: UtilConstants.blackColor,
                    size: 40,
                  ),
                ),
        ],
      ),
    );
  }
}
