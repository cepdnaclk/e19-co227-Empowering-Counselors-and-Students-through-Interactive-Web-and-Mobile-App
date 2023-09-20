import 'package:bloomi_web/components/homepage_card_widget_diamond.dart';
import 'package:bloomi_web/components/homepage_card_widget_friend.dart';
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
          top: 10,
          bottom: 20,
          left: 40,
          right: 40,
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Shadow color
                    spreadRadius: 5, // Spread radius
                    blurRadius: 7, // Blur radius
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
                    "Counseling is Your Safe Harbor",
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
                  const Text(
                    "\"In counseling, you'll find a safe harbor where you can navigate life's storms.\"",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'DancingScript'),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
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
                              '"Travel, where the journey is as enchanting as the destination."',
                          imagePath: UtilConstants.travelImagePath),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: CardWidgetFriend(
                      items: ItemClass(
                          title: '"Good friends make life beautiful."',
                          imagePath: UtilConstants.friendsImagePath),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Shadow color
                    spreadRadius: 5, // Spread radius
                    blurRadius: 7, // Blur radius
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
                    "A Guiding Light",
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
                  const Text(
                    "\"Counseling can be the guiding light that leads you out of the darkness.\"",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "monospace"),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
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
