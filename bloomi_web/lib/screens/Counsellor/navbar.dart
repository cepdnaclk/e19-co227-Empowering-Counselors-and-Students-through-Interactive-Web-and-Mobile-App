import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/providers/nav_provider/navigation_provider.dart';
import 'package:bloomi_web/screens/counsellor/calender.dart';
import 'package:bloomi_web/screens/counsellor/dashboard.dart';
import 'package:bloomi_web/screens/counsellor/drawer.dart';
import 'package:bloomi_web/screens/counsellor/message.dart';
import 'package:bloomi_web/screens/counsellor/profile.dart';
import 'package:bloomi_web/screens/counsellor/topbar_contents.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*
class CounselorNavBar extends StatefulWidget {
  const CounselorNavBar({Key? key}) : super(key: key);

  @override
  State<CounselorNavBar> createState() => _CounselorNavBarState();
}

class _CounselorNavBarState extends State<CounselorNavBar> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var screenSize = mediaQueryData.size;

    final List<Widget> widgets = [
      const Dashboard(),
      const CounselorCalender(),
      const CounselorMessage(),
      const CounselorProfile(),
    ];

    return Scaffold(
      bottomNavigationBar: Footer(mediaQueryData: mediaQueryData),
      appBar: (screenSize.width <= 900)
          ? AppBar(
              iconTheme: const IconThemeData(color: UtilConstants.primaryColor),
              backgroundColor: UtilConstants.lightgreyColor,
              elevation: 0,
              centerTitle: true,
              title: CustomText("BLOOMI",
                  fontSize: screenSize.width * 0.03,
                  fontWeight: FontWeight.w300,
                  fontColor: Colors.blue),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, screenSize.height),
              child: const TopBarContents(),
            ),
      body: Center(
        // Replace this with the content you want to display in the body
        child: Column(
          children: [
            Consumer<NavigationProvider>(
              builder: (context, value, child) {
                return widgets[value.currentIndex];
              },
            ),
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
      drawer: const CounselorDrawer(),
    );
  }
}*/

class CounselorHome extends StatefulWidget {
  const CounselorHome({Key? key}) : super(key: key);

  @override
  State<CounselorHome> createState() => _CounselorHomeState();
}

class _CounselorHomeState extends State<CounselorHome> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    final List<Widget> widgets = [
      const Dashboard(),
      const CounselorCalender(),
      const MessagingCard(),
      const CounselorProfile(
        name: 'John Doe',
        email: 'johndoe@example.com',
        faculty: 'Engineering',
        department: 'Computer Engineering',
        imageUrl: '../assets/images/profileimage.webp',
      ),
    ];
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
      body: Consumer<NavigationProvider>(
        builder: (context, value, child) {
          return widgets[value.currentIndex];
        },
      ),
      drawer: const CounselorDrawer(),
      //bottomNavigationBar: Footer(mediaQueryData: mediaQueryData),
    );
  }
}
