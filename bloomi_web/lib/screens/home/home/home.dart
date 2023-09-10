import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/components/drawer.dart';
import 'package:bloomi_web/components/footer.dart';
import 'package:bloomi_web/screens/home/home/home_page.dart';
import 'package:bloomi_web/screens/home/home/navbar.dart';
import 'package:bloomi_web/utils/util_constant.dart';
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
      appBar: (mediaQueryData.size.width <= 900)
          ? AppBar(
              iconTheme: const IconThemeData(color: UtilConstants.primaryColor),
              backgroundColor: UtilConstants.lightgreyColor,
              elevation: 0,
              centerTitle: true,
              title: CustomText("BLOOMI",
                  fontSize: mediaQueryData.size.width * 0.03,
                  fontWeight: FontWeight.w300,
                  fontColor: UtilConstants.primaryColor))
          : PreferredSize(
              preferredSize: Size(mediaQueryData.size.width, 70),
              child: const HomeNavBar(),
            ),
      body: Center(
        // Replace this with the content you want to display in the body
        child: Column(
          children: [
            const HomePage(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Footer(mediaQueryData: mediaQueryData),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
