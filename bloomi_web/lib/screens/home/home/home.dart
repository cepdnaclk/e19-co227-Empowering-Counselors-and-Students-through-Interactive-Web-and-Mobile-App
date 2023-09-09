import 'package:bloomi_web/screens/home/home/navbar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(
          mediaQueryData.size.width,
          mediaQueryData.size.height,
        ),
        child: const HomeNavBar(),
      ),
      body: const Center(
        // Replace this with the content you want to display in the body
        child: Text('Hello, this is the home page content'),
      ),
    );
  }
}
