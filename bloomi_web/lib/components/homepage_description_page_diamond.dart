import 'package:bloomi_web/components/homepage_card_widget_self.dart';
import 'package:bloomi_web/components/homepage_class.dart';
import 'package:bloomi_web/components/homepage_diamond_page_constants.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class DescriptionPageDiamond extends StatefulWidget {
  const DescriptionPageDiamond({super.key, required this.items});

  final ItemClass items;

  @override
  State<DescriptionPageDiamond> createState() => _DescriptionPageDiamondState();
}

class _DescriptionPageDiamondState extends State<DescriptionPageDiamond> {
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
                diamondColumn1,
                const SizedBox(
                  height: 10,
                ),
                diamondColumn2,
                const SizedBox(
                  height: 10,
                ),
                diamondColumn3,
                const SizedBox(
                  height: 10,
                ),
                diamondColumn4,
                const SizedBox(
                  height: 10,
                ),
                diamondColumn5,
                const SizedBox(
                  height: 10,
                ),
                diamondColumn6,
                const SizedBox(
                  height: 10,
                ),
                diamondColumn7,
                const SizedBox(
                  height: 10,
                ),
                diamondColumn8,
                const SizedBox(
                  height: 10,
                ),
                diamondColumn9,
                const SizedBox(
                  height: 10,
                ),
                diamondColumn10,
                const SizedBox(
                  height: 10,
                ),
                depColumn1,
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                depColumn2,
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                depColumn3,
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                depColumn4,
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                depColumn5,
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                depColumn6,
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                depColumn7,
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                depColumn8,
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                depColumn9,
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                depColumn10,
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                depColumn11,
                const SizedBox(
                  height: 10,
                ),
                CardWidgetSelf(
                  items: ItemClass(
                      title: "", imagePath: UtilConstants.diamondLastImagePath),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
