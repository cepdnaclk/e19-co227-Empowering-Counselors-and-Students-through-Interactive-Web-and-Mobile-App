import 'package:flutter/material.dart';

class ConversationImage extends StatelessWidget {
  final double width;
  final double height;
  final String imagePath;
  const ConversationImage({
    super.key,
    this.width = 45,
    this.height = 45,
    required this.imagePath,
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
        child: Image.network(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
