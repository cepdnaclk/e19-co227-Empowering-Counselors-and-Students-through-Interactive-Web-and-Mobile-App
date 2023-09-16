import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class ConversationImage extends StatelessWidget {
  const ConversationImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: const BoxDecoration(
        shape: BoxShape.circle, // Use BoxShape.circle to create an oval shape
      ),
      child: ClipOval(
        // Use ClipOval instead of ClipRRect
        child: Image.asset(
          UtilConstants.profImagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
