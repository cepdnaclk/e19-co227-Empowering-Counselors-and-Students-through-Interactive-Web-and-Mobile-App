import 'package:bloomi/components/custom_text.dart';
import 'package:flutter/material.dart';

class HomeNabBar extends StatefulWidget {
  const HomeNabBar({super.key});

  @override
  State<HomeNabBar> createState() => _HomeNabBarState();
}

class _HomeNabBarState extends State<HomeNabBar> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CustomText("Nav Bar"),
      ),
    );
  }
}
