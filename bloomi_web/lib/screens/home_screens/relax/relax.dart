import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class Relax extends StatefulWidget {
  const Relax({super.key});

  @override
  State<Relax> createState() => _RelaxState();
}

class _RelaxState extends State<Relax> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UtilConstants.homeBackgroundColor.withOpacity(0.5),
      body: const Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            CustomText("Relax"),
          ],
        ),
      ),
    );
  }
}
