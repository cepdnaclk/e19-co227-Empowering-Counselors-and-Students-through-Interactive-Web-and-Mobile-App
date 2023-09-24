import 'package:bloomi_web/components/homepage_class.dart';
import 'package:bloomi_web/components/homepage_constants.dart';
import 'package:bloomi_web/components/homepage_description_page_cook.dart';
import 'package:flutter/material.dart';

class CardWidgetCook extends StatelessWidget {
  const CardWidgetCook({super.key, required this.items});
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
              return DescriptionPageCook(
                items: items,
              );
            },
          ),
        );
      },
      child: Card(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 500,
          padding: const EdgeInsets.all(kDouble10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: kDouble5,
              ),
              SizedBox(
                height: 400,
                child: Image.asset(
                  items.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 50,
                child: Text(
                  items.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'BodoniModa',
                  ),
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
