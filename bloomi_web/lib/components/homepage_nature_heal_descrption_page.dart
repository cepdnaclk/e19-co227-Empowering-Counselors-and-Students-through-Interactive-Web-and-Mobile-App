import 'package:bloomi_web/components/homepage_card_widget_self.dart';
import 'package:bloomi_web/components/homepage_class.dart';
import 'package:bloomi_web/components/homepage_nature_heal_constants.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class DescriptionPageNature extends StatefulWidget {
  const DescriptionPageNature({super.key, required this.items});

  final ItemClass items;

  @override
  State<DescriptionPageNature> createState() => _DescriptionPageNatureState();
}

class _DescriptionPageNatureState extends State<DescriptionPageNature> {
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
            padding: const EdgeInsets.all(20),
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
                natureColumn1,
                const SizedBox(
                  height: 15,
                ),
                natureColumn2,
                const SizedBox(
                  height: 15,
                ),
                natureColumn3,
                const SizedBox(
                  height: 15,
                ),
                natureColumn4,
                const SizedBox(
                  height: 15,
                ),
                natureColumn5,
                const SizedBox(
                  height: 15,
                ),
                natureColumn6,
                const SizedBox(
                  height: 15,
                ),
                CardWidgetSelf(
                  items: ItemClass(
                      title: "",
                      imagePath: UtilConstants.sunsetHealingImagePath),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
