/* import 'package:bloomi_web/components/custom_card_widget.dart'; */
import 'package:bloomi_web/components/homepage_card_widget_self.dart';
import 'package:bloomi_web/components/homepage_card_widget_yoga.dart';
import 'package:bloomi_web/components/homepage_class.dart';
import 'package:bloomi_web/utils/util_constant.dart';
/* import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/utils/util_constant.dart'; */
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
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
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
                          title: UtilConstants.yogaTitle,
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
