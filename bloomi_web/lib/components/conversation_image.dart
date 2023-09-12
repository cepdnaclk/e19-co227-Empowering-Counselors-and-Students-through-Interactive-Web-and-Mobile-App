import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class ConversationImage extends StatelessWidget {
  const ConversationImage({
    super.key,
    required this.mediaQueryData,
  });

  final MediaQueryData mediaQueryData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mediaQueryData.size.width * 0.04,
      height: mediaQueryData.size.width * 0.04,
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
