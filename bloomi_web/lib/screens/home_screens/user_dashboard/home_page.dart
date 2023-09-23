import 'package:bloomi_web/components/homepage_card_widget_diamond.dart';
import 'package:bloomi_web/components/homepage_card_widget_friend.dart';
import 'package:bloomi_web/components/homepage_card_widget_gardening.dart';
import 'package:bloomi_web/components/homepage_card_widget_music.dart';
import 'package:bloomi_web/components/homepage_card_widget_nature.dart';
import 'package:bloomi_web/components/homepage_card_widget_reading.dart';
import 'package:bloomi_web/components/homepage_card_widget_self.dart';
import 'package:bloomi_web/components/homepage_card_widget_travel.dart';
import 'package:bloomi_web/components/homepage_card_widget_wildlife.dart';
import 'package:bloomi_web/components/homepage_card_widget_yoga.dart';
import 'package:bloomi_web/components/homepage_class.dart';
import 'package:bloomi_web/components/homepage_quote.dart';
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
    //double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: UtilConstants.homePageBackgroundColor,
      body: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 25,
              bottom: 20,
              left: 20,
            ),
            width: 400,
            height: height,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 20,
                left: 20,
                right: 40,
              ),
              child: Column(
                children: [
                  const HomePageQuote(
                    quoteTitle: "Counselling is your Safe Harbor",
                    quoteContent:
                        "\"In counselling, you'll find a safe harbor where you can navigate life's storms.\"",
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          child: CardWidgetNature(
                            items: ItemClass(
                                title: '"The Healing Power of Nature."',
                                imagePath:
                                    UtilConstants.natureHealingImagePath),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          child: CardWidgetDiamond(
                            items: ItemClass(
                                title: '"Shine like a Bright Diamond."',
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
                  const HomePageQuote(
                    quoteTitle: "A Guiding Light",
                    quoteContent:
                        "\"Counseling can be the guiding light that leads you out of the darkness.\"",
                  ),
                  CardWidgetSelf(
                    items: ItemClass(
                      title: UtilConstants.selfCareTitle,
                      imagePath: UtilConstants.selfCareImagePath,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          child: CardWidgetYoga(
                            items: ItemClass(
                                title:
                                    "\"Yoga: A journey within to find tranquility and nurture mental health.\"",
                                imagePath: UtilConstants.yogaImagePath),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          child: CardWidgetGardening(
                            items: ItemClass(
                                title:
                                    '"Gardening is a living art, where patience is the canvas and nature is the masterpiece."',
                                imagePath: UtilConstants.gardeningImagePath),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const HomePageQuote(
                    quoteTitle: "Unveiling Strength Through Counseling",
                    quoteContent:
                        "\"Counseling isn't about fixing what's wrong; it's about discovering the incredible strength and resilience that has been within you all along.\"",
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          child: CardWidgetRead(
                            items: ItemClass(
                                title:
                                    '"Books: where every page turns into an unforgettable adventure."',
                                imagePath: UtilConstants.readImagePath),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          child: CardWidgetWild(
                            items: ItemClass(
                                title:
                                    '"Watching wildlife: where peace meets the wild."',
                                imagePath: UtilConstants.wildImagePath3),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          child: CardWidgetMusic(
                            items: ItemClass(
                                title:
                                    '"Music soothes the soul, a balm for a weary mind."',
                                imagePath: UtilConstants.musicImagePath2),
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
                  const HomePageQuote(
                    quoteTitle: "Embracing the Healing Path",
                    quoteContent:
                        "\"Remember, in the vulnerability of seeking counseling, you are not broken; you are a masterpiece in progress, and counseling is the brush that helps you paint a brighter future.\"",
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
          ),
        ],
      ),
    );
  }
}
