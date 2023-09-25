// ignore_for_file: avoid_print

import 'package:bloomi_web/providers/admin/counselor_registration_provider.dart';
import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class MessageTypingWidgetCounsellor extends StatelessWidget {
  const MessageTypingWidgetCounsellor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MessageBar(
      onSend: (String msg) {
        Logger().e(msg);
        if (msg.trim().isNotEmpty) {
          Provider.of<CounsellorRegistrationProvider>(context, listen: false)
              .startSendMessage(context, msg);
        }
      },
      actions: [
        InkWell(
          child: const Icon(
            Icons.add,
            color: Colors.black,
            size: 24,
          ),
          onTap: () {},
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: InkWell(
            child: const Icon(
              Icons.camera_alt,
              color: Colors.green,
              size: 24,
            ),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
