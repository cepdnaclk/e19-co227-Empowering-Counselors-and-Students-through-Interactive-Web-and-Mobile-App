import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class ConversationImage extends StatelessWidget {
  final double width;
  final double height;
  const ConversationImage({
    super.key,
    this.width = 45,
    this.height = 45,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
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
