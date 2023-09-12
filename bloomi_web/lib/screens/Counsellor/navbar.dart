import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/components/footer.dart';
import 'package:bloomi_web/providers/nav_provider/navigation_provider.dart';
import 'package:bloomi_web/screens/Counsellor/calender.dart';
import 'package:bloomi_web/screens/Counsellor/dashboard.dart';
import 'package:bloomi_web/screens/Counsellor/drawer.dart';
import 'package:bloomi_web/screens/Counsellor/message.dart';
import 'package:bloomi_web/screens/Counsellor/profile.dart';
import 'package:bloomi_web/screens/Counsellor/topbar_contents.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounselorNavBar extends StatefulWidget {
  const CounselorNavBar({super.key});

  @override
  State<CounselorNavBar> createState() => _CounselorNavBarState();
}

class _CounselorNavBarState extends State<CounselorNavBar> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var screenSize = mediaQueryData.size;

    final List<Widget> widget = [
      const Dashboard(),
      const CounselorCalender(),
      const CounselorMessage(),
      const CounselorProfile(),
    ];

    /*return Scaffold(
      appBar: (screenSize.width<452)? AppBar(
        iconTheme: const IconThemeData(color: Colors.blue),
        backgroundColor: UtilConstants.lightgreyColor,
        title: const Text(
          "Bloomi",
        ),
        centerTitle: true,
        elevation: 0,
      )
      
      :PreferredSize(
        preferredSize: Size(screenSize.width, screenSize.height),
        child: const TopBarContents(),

      ),
      drawer: const CounselorDrawer(),
    );*/

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
                  fontColor: Colors.blue))
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
                return widget[value.currentIndex];
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
}
