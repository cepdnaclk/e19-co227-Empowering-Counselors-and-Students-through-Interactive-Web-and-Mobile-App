import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserDetailsViewCard extends StatelessWidget {
  UserDetailsViewCard({super.key});

  bool isSmall = false;
  bool isMini = false;

//fetch counselors count, pending and accepted appointment counts
  final int counselors = 0;
  final int pending = 5;
  final int confirm = 1;

  Widget customContainer(
    String text,
    int value,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 187, 187, 215),
        borderRadius: BorderRadius.circular(20),
      ),
      width: isSmall ? (isMini ? 100 : 160) : 210,
      height: isSmall ? 70 : 100,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: isSmall ? 15 : 18,
                shadows: [
                  Shadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: const Offset(2, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
            SizedBox(height: isSmall ? 5 : 10),
            Text(
              value.toString(),
              style: TextStyle(
                fontSize: isSmall ? 15 : 20,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: const Offset(2, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < 700) {
      isSmall = true;
    }
    if (MediaQuery.of(context).size.width < 540) {
      isMini = true;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customContainer('Counselors', counselors),
        customContainer('Pending', pending),
        customContainer('Confirmed', confirm),
      ],
    );
  }
}
