import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bloomi_web/components/footer.dart';
import 'package:bloomi_web/components/homepage_card_widget_cooking.dart';
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
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: UtilConstants.homePageBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 20,
                left: 20,
                right: 40,
              ),
              child: Column(
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: 600.0,
                        height: 50,
                        child: DefaultTextStyle(
                          style: const TextStyle(
                            fontSize: 30.0,
                            fontFamily: 'Times New Roman',
                          ),
                          child: ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return const LinearGradient(
                                colors: [
                                  Colors.pink,
                                  Colors.blue,
                                  Colors.green,
                                  Colors.lightGreen,
                                ],
                                stops: [
                                  0.0,
                                  0.33,
                                  0.67,
                                  1.0
                                ], // Adjust stops to control the gradient positions
                              ).createShader(bounds);
                            },
                            child: AnimatedTextKit(
                              animatedTexts: [
                                TypewriterAnimatedText(
                                  'WELCOME TO BLOOMi',
                                  textAlign: TextAlign.center,
                                  speed: const Duration(milliseconds: 200),
                                  textStyle: const TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 5.0,
                                        color: Colors.black,
                                        offset: Offset(1, 10),
                                      ),
                                    ],
                                  ),
                                  cursor: '|',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const HomePageQuote(
                        quoteTitle: "Counselling is your Safe Harbor",
                        quoteContent:
                            "\"In counselling, you'll find a safe harbor where you can navigate life's storms.\"",
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Card(
                                  child: CardWidgetNature(
                                    items: ItemClass(
                                        title: '"The Healing Power of Nature."',
                                        imagePath: UtilConstants
                                            .natureHealingImagePath),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Card(
                                  child: CardWidgetDiamond(
                                    items: ItemClass(
                                        title: '"Shine like a Bright Diamond."',
                                        imagePath:
                                            UtilConstants.diamondImagePath),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Card(
                                  child: CardWidgetTravel(
                                    items: ItemClass(
                                        title:
                                            '"Exploration allows serenity to flourish."',
                                        imagePath:
                                            UtilConstants.travelImagePath),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Card(
                                  child: CardWidgetFriend(
                                    items: ItemClass(
                                        title:
                                            '"Good friends make life beautiful."',
                                        imagePath:
                                            UtilConstants.friendsImagePath),
                                  ),
                                ),
                              ),
                            ],
                          )
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
                                    imagePath:
                                        UtilConstants.gardeningImagePath),
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
                                        '"Music: soothes the soul, a balm for a weary mind."',
                                    imagePath: UtilConstants.musicImagePath1),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Card(
                              child: CardWidgetCook(
                                items: ItemClass(
                                    title:
                                        '"Cooking: A meditative escape where stress dissolves in the flavors, offering relaxation for the soul."',
                                    imagePath: UtilConstants.cookingImagePath1),
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
                    ],
                  ),
                ],
              ),
            ),
            Footer(height: 55, width: width)
          ],
        ),
      ),
    );
  }
}
