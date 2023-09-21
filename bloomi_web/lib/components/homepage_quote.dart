import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class HomePageQuote extends StatelessWidget {
  final String quoteTitle;
  final String quoteContent;
  const HomePageQuote({
    super.key,
    required this.quoteTitle,
    required this.quoteContent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: UtilConstants.homepageQuoteBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: UtilConstants.homepageQuoteShadowColor, // Shadow color
            spreadRadius: 2, // Spread radius
            blurRadius: 2, // Blur radius
            offset: const Offset(0, 3), // Offset (horizontal, vertical)
          ),
        ],
      ),
      margin: const EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            quoteTitle,
            style: TextStyle(
              color: UtilConstants.homePageQuoteTitleColor,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  color: UtilConstants.naturePageShadowColor,
                  blurRadius: 10,
                  offset: const Offset(10, 10),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            quoteContent,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "monospace"),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
