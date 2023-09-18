/* import 'package:bloomi_web/components/homepage_card_widget_self.dart'; */
import 'package:bloomi_web/components/homepage_card_widget_self.dart';
import 'package:bloomi_web/components/homepage_class.dart';
import 'package:bloomi_web/components/homepage_constants.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class DescriptionPageSelf extends StatefulWidget {
  const DescriptionPageSelf({super.key, required this.items});

  final ItemClass items;

  @override
  State<DescriptionPageSelf> createState() => _DescriptionPageSelfState();
}

class _DescriptionPageSelfState extends State<DescriptionPageSelf> {
  double fontSizeCustom = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UtilConstants.homePageBackgroundColor,
      appBar: AppBar(
        backgroundColor: UtilConstants.lightgreyColor,
        /* automaticallyImplyLeading: false, ||To remove back button in new page */
        //title: Text(widget.items.title),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.dangerous),
        ),
        /* backgroundColor: Colors.red, */
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('snackbar'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            icon: const Icon(Icons.info),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 10,
          ),
          child: Padding(
            padding: const EdgeInsets.all(kDouble20),
            child: Column(
              children: [
                Image.asset(widget.items.imagePath),
                FittedBox(
                  child: Text(
                    widget.items.title,
                    style: TextStyle(
                        fontSize: fontSizeCustom, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  selfCareDescription1,
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  selfCareDescription2,
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 15,
                ),
                activity1,
                const SizedBox(
                  height: 15,
                ),
                activity2,
                const SizedBox(
                  height: 15,
                ),
                activity3,
                const SizedBox(
                  height: 15,
                ),
                activity4,
                const SizedBox(
                  height: 15,
                ),
                activity5,
                const SizedBox(
                  height: 15,
                ),
                activity6,
                const SizedBox(
                  height: 15,
                ),
                activity7,
                const SizedBox(
                  height: 15,
                ),
                activity8,
                const SizedBox(
                  height: 15,
                ),
                activity9,
                const SizedBox(
                  height: 15,
                ),
                activity10,
                const SizedBox(
                  height: 15,
                ),
                activity11,
                const SizedBox(
                  height: 15,
                ),
                activity12,
                const SizedBox(
                  height: 15,
                ),
                activity13,
                const SizedBox(
                  height: 15,
                ),
                activity14,
                const SizedBox(
                  height: 15,
                ),
                activity15,
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 15,
                ),
                CardWidgetSelf(
                  items: ItemClass(
                      title: "",
                      imagePath: UtilConstants.selfCareIsntSelfishImagePath),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
