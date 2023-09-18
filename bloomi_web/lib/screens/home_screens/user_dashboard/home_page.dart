/* import 'package:bloomi_web/components/custom_card_widget.dart'; */
import 'package:bloomi_web/components/homepage_card_widget.dart';
import 'package:bloomi_web/components/homepage_class.dart';
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
      /* appBar: AppBar(
        title: const Text("Home Page"),
      ), */
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CardWidget(
              items: ItemClass(
                  title: 'Rocket', imagePath: 'assets/images/selfcare.png'),
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: CardWidget(
                      items: ItemClass(
                          title: 'Space', imagePath: 'assets/images/self.png'),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: CardWidget(
                      items: ItemClass(
                          title: 'Travel', imagePath: 'assets/images/self.png'),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: CardWidget(
                      items: ItemClass(
                          title: 'Space', imagePath: 'assets/images/self.png'),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: CardWidget(
                      items: ItemClass(
                          title: 'Travel', imagePath: 'assets/images/self.png'),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: CardWidget(
                      items: ItemClass(
                          title: 'Space', imagePath: 'assets/images/self.png'),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: CardWidget(
                      items: ItemClass(
                          title: 'Travel', imagePath: 'assets/images/self.png'),
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
