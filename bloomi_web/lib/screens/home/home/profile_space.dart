import 'package:bloomi_web/screens/home/home/chat/classes/item_class.dart';
import 'package:bloomi_web/screens/home/home/chat/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class AccountList extends StatelessWidget {
  const AccountList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          CardWidget(
            items: ItemClass(
              title: 'Prof',
              imagePath: 'assets/images/pro.png',
            ),
          )
        ],
      ),
    );
  }
}

/*
height: 200,
        color: Colors.blue,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: 200,
                color: Colors.purple,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
*/