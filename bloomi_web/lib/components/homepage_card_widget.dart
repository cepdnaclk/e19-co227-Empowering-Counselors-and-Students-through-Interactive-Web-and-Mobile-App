import 'package:bloomi_web/components/homepage_class.dart';
import 'package:bloomi_web/components/homepage_constants.dart';
import 'package:bloomi_web/components/homepage_description_page.dart';
import 'package:flutter/material.dart';
/* import 'package:new_project/class/item_class.dart';
import 'package:new_project/core/constants.dart';
import 'package:new_project/pages/description_page.dart'; */

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.items});
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
              return DescriptionPage(
                items: items,
              );
            },
          ),
        );
      },
      child: Card(
        child: Container(
          width: double.infinity,
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
                  fontSize: 22,
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
