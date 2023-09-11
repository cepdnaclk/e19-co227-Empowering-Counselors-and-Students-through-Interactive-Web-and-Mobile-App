import 'package:bloomi_web/components/contact_cart.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  int currentIndex = 0;

  final List<String> names = [
    "Sachith Dissanayaka",
    "kamal Perera",
    "Nimal Bandara"
  ];
  final List<String> fac = [
    "Faculty of Engineering",
    "Faculty of Art",
    "Faculty of Medicine"
  ];
  final List<String> email = [
    "sachithdissanayaka135@gmail.com",
    "kamalperera135@gmail.com",
    "nimalbandara@gmail.com"
  ];
  final List<String> phone = [
    "0705156085",
    "0712345678",
    "0765432190",
  ];

  void goToNextPage() {
    setState(() {
      currentIndex = (currentIndex + 1) % names.length;
    });
  }

  void goToPreviousPage() {
    setState(() {
      currentIndex = (currentIndex - 1 + names.length) % names.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Column(
      children: [
        SizedBox(height: mediaQueryData.size.height * 0.07),
        SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  goToPreviousPage();
                },
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: UtilConstants.primaryColor,
                  size: 40,
                ),
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                switchInCurve: Curves.linear, // Change animation type here

                child: ContactCart(
                  key: Key(currentIndex.toString()), // Key for AnimatedSwitcher
                  name: names[currentIndex],
                  fac: fac[currentIndex],
                  email: email[currentIndex],
                  phone: phone[currentIndex],
                  mediaQueryData: mediaQueryData,
                ),
              ),
              InkWell(
                onTap: () {
                  goToNextPage();
                },
                child: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: UtilConstants.primaryColor,
                  size: 40,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
