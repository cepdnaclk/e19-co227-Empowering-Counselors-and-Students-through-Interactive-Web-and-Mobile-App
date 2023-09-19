import 'package:bloomi_web/components/homepage_class.dart';
import 'package:bloomi_web/components/homepage_constants.dart';
import 'package:bloomi_web/components/homepage_nature_heal_descrption_page.dart';
import 'package:flutter/material.dart';

class CardWidgetNature extends StatelessWidget {
  const CardWidgetNature({super.key, required this.items});
  final ItemClass items;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Clickable thing
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DescriptionPageNature(
                items: items,
              );
            },
          ),
        );
      },
      child: Card(
        child: Container(
          width: double.infinity,
          height: 350,
          padding: const EdgeInsets.all(kDouble10),
          child: Column(
            children: [
              const SizedBox(
                height: kDouble5,
              ),
              Image.asset(items.imagePath),
              Text(
                items.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: kDouble10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
