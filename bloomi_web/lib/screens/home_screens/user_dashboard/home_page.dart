import 'package:bloomi_web/components/homepage_card_widget_diamond.dart';
import 'package:bloomi_web/components/homepage_card_widget_nature.dart';
import 'package:bloomi_web/components/homepage_card_widget_self.dart';
import 'package:bloomi_web/components/homepage_card_widget_travel.dart';
import 'package:bloomi_web/components/homepage_card_widget_yoga.dart';
import 'package:bloomi_web/components/homepage_class.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UtilConstants.homePageBackgroundColor,
      /* appBar: AppBar(
        title: const Text("Home Page"),
      ), */
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 20,
          left: 40,
          right: 40,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: CardWidgetNature(
                      items: ItemClass(
                          title: '"The Healing Power of Nature"',
                          imagePath: UtilConstants.natureHealingImagePath),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: CardWidgetDiamond(
                      items: ItemClass(
                          title: '"Shine like a Bright Diamond"',
                          imagePath: UtilConstants.diamondImagePath),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: CardWidgetTravel(
                      items: ItemClass(
                          title:
                              '"Travel far, travel wide, and discover the world outside to find the treasures within."',
                          imagePath: UtilConstants.travelImagePath),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: CardWidgetYoga(
                      items: ItemClass(
                          title: 'Travel',
                          imagePath: UtilConstants.otherImagePath),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: CardWidgetYoga(
                      items: ItemClass(
                          title: 'Space',
                          imagePath: UtilConstants.otherImagePath),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: CardWidgetYoga(
                      items: ItemClass(
                          title: 'Travel',
                          imagePath: UtilConstants.otherImagePath),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: CardWidgetYoga(
                      items: ItemClass(
                          title: 'Travel',
                          imagePath: UtilConstants.otherImagePath),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: CardWidgetYoga(
                      items: ItemClass(
                          title: 'Travel',
                          imagePath: UtilConstants.otherImagePath),
                    ),
                  ),
                ),
              ],
            ),
            CardWidgetSelf(
              items: ItemClass(
                  title: UtilConstants.selfCareTitle,
                  imagePath: UtilConstants.selfCareImagePath),
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: CardWidgetYoga(
                      items: ItemClass(
                          title:
                              "\"Yoga: A journey within to find tranquility and nurture mental health\"",
                          imagePath: UtilConstants.yogaImagePath),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: CardWidgetYoga(
                      items: ItemClass(
                          title: 'Travel',
                          imagePath: UtilConstants.otherImagePath),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: CardWidgetYoga(
                      items: ItemClass(
                          title: 'Space',
                          imagePath: UtilConstants.otherImagePath),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: CardWidgetYoga(
                      items: ItemClass(
                          title: 'Travel',
                          imagePath: UtilConstants.otherImagePath),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: CardWidgetYoga(
                      items: ItemClass(
                          title: 'Space',
                          imagePath: UtilConstants.otherImagePath),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: CardWidgetYoga(
                      items: ItemClass(
                          title: 'Travel',
                          imagePath: UtilConstants.otherImagePath),
                    ),
                  ),
                ),
              ],
            ),
            /* Card(
              child: CardWidget(
                items: ItemClass(
                    title: 'Yeah', imagePath: 'assets/images/talk.png'),
              ),
            ), */
          ],
        ),
      ),
    );
  }
}
