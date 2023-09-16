/*import 'package:bloomi_web/components/custom_navbar_widget.dart';
import 'package:bloomi_web/providers/nav_provider/navigation_provider.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopBarContents extends StatefulWidget {
  const TopBarContents({Key? key}) : super(key: key);

  @override
  _TopBarContentsState createState() => _TopBarContentsState();
}

/*
class _TopBarContentsState extends State<TopBarContents> {
  final List<bool> _isHovering = List.generate(4, (_) => false);

  double getTextWidth(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: style,
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    return textPainter.width;
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final Size screenSize = mediaQueryData.size;

    return Container(
      color: UtilConstants.lightgreyColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Column(
                children: [
                  const SizedBox(
                    width: 20.0,
                  ),
                  Icon(
                    Icons.menu,
                    size: 24.0,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 100.0,
            ),
            for (int index = 0; index < 4; index++)
              InkWell(
                onHover: (value) {
                  setState(() {
                    _isHovering[index] = value;
                  });
                },
                onTap: () {
                  Provider.of<NavigationProvider>(context, listen: false)
                      .setIndex(index);
                },
                child: Column(
                  children: [
                    CustomNavBarWidget(
                      _getNavItemTitle(index),
                      mediaQueryData: mediaQueryData,
                      isHovering: _isHovering[index],
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    Visibility(
                      maintainAnimation: true,
                      maintainState: true,
                      maintainSize: true,
                      visible: _isHovering[index],
                      child: Container(
                        width: getTextWidth(
                          _getNavItemTitle(index),
                          TextStyle(fontSize: 12.0),
                        ),
                        height: 2.0,
                        color: UtilConstants.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  String _getNavItemTitle(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'Calendar';
      case 2:
        return 'Chat';
      case 3:
        return 'Profile';
      default:
        return '';
    }
  }
}*/
class _TopBarContentsState extends State<TopBarContents> {
  final List<bool> _isHovering = [
    false,
    false,
    false,
    false,
  ];

  double getTextWidth(String text, TextStyle style) {
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: style,
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    return textPainter.width;
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var screenSize = mediaQueryData.size;

    return Container(
      color: UtilConstants.lightgreyColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Stack(
          children: [
            Row(
              children: [
                InkWell(
                  child: Column(children: [
                    SizedBox(
                      width: screenSize.width * 0.05,
                    ),
                    Icon(
                      Icons.menu,
                      size: screenSize.width * 0.02,
                    ),
                  ]),
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
                SizedBox(
                  width: screenSize.width * 0.65,
                ),
                InkWell(
                  onHover: (value) {
                    setState(() {
                      value ? _isHovering[0] = true : _isHovering[0] = false;
                    });
                  },
                  onTap: () {
                    Provider.of<NavigationProvider>(context, listen: false)
                        .setIndex(0);
                  },
                  child: Column(
                    children: [
                      CustomNavBarWidget("Home",
                          mediaQueryData: mediaQueryData,
                          isHovering: _isHovering[0]),
                      SizedBox(
                        height: screenSize.height * 0.0008,
                      ),
                      Visibility(
                        maintainAnimation: true,
                        maintainState: true,
                        maintainSize: true,
                        visible: _isHovering[0],
                        child: Container(
                          width: getTextWidth("Home",
                              TextStyle(fontSize: screenSize.width * 0.0145)),
                          height: screenSize.width * 0.003,
                          color: UtilConstants.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: screenSize.width * 0.03,
                ),
                InkWell(
                  onHover: (value) {
                    setState(() {
                      value ? _isHovering[1] = true : _isHovering[1] = false;
                    });
                  },
                  onTap: () {
                    Provider.of<NavigationProvider>(context, listen: true)
                        .setIndex(1);
                  },
                  child: Column(
                    children: [
                      CustomNavBarWidget("Calender",
                          mediaQueryData: mediaQueryData,
                          isHovering: _isHovering[1]),
                      SizedBox(
                        height: screenSize.height * 0.0008,
                      ),
                      Visibility(
                        maintainAnimation: true,
                        maintainState: true,
                        maintainSize: true,
                        visible: _isHovering[1],
                        child: Container(
                          width: getTextWidth("Calender",
                              TextStyle(fontSize: screenSize.width * 0.0145)),
                          height: screenSize.width * 0.003,
                          color: UtilConstants.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: screenSize.width * 0.03,
                ),
                InkWell(
                  onHover: (value) {
                    setState(() {
                      value ? _isHovering[2] = true : _isHovering[2] = false;
                    });
                  },
                  onTap: () {
                    Provider.of<NavigationProvider>(context, listen: false)
                        .setIndex(2);
                  },
                  child: Column(
                    children: [
                      CustomNavBarWidget("Chat",
                          mediaQueryData: mediaQueryData,
                          isHovering: _isHovering[2]),
                      SizedBox(
                        height: screenSize.height * 0.0008,
                      ),
                      Visibility(
                        maintainAnimation: true,
                        maintainState: true,
                        maintainSize: true,
                        visible: _isHovering[2],
                        child: Container(
                          width: getTextWidth("Chat",
                              TextStyle(fontSize: screenSize.width * 0.0145)),
                          height: screenSize.width * 0.003,
                          color: UtilConstants.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: screenSize.width * 0.03,
                ),
                InkWell(
                  onHover: (value) {
                    setState(() {
                      value ? _isHovering[3] = true : _isHovering[3] = false;
                    });
                  },
                  onTap: () {
                    Provider.of<NavigationProvider>(context, listen: false)
                        .setIndex(3);
                  },
                  child: Column(
                    children: [
                      CustomNavBarWidget("Profile",
                          mediaQueryData: mediaQueryData,
                          isHovering: _isHovering[3]),
                      SizedBox(
                        height: screenSize.height * 0.0008,
                      ),
                      Visibility(
                        maintainAnimation: true,
                        maintainState: true,
                        maintainSize: true,
                        visible: _isHovering[3],
                        child: Container(
                          width: getTextWidth("profile",
                              TextStyle(fontSize: screenSize.width * 0.0145)),
                          height: screenSize.width * 0.003,
                          color: UtilConstants.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
*/

import 'package:bloomi_web/components/custom_navbar_widget.dart';
import 'package:bloomi_web/providers/nav_provider/navigation_provider.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounsellorNavBar extends StatefulWidget {
  const CounsellorNavBar({Key? key}) : super(key: key);

  @override
  State<CounsellorNavBar> createState() => _CounsellorNavBarState();
}

class _CounsellorNavBarState extends State<CounsellorNavBar> {
  final List<bool> _isHovering = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Container(
      color: UtilConstants.lightgreyColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  SizedBox(
                    width: mediaQueryData.size.width * 0.02,
                  ),
                  InkWell(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Icon(
                      Icons.menu,
                      size: mediaQueryData.size.width * 0.02,
                    ),
                  ),
                  SizedBox(
                    width: mediaQueryData.size.width * 0.65,
                  ),
                  InkWell(
                    onHover: (value) {
                      setState(() {
                        value ? _isHovering[0] = true : _isHovering[0] = false;
                      });
                    },
                    onTap: () {
                      Provider.of<NavigationProvider>(context, listen: false)
                          .setIndex(0);
                    },
                    child: CustomNavBarWidget("Home",
                        mediaQueryData: mediaQueryData,
                        isHovering: _isHovering[0]),
                  ),
                  SizedBox(
                    width: mediaQueryData.size.width * 0.03,
                  ),
                  InkWell(
                    onHover: (value) {
                      setState(() {
                        value ? _isHovering[1] = true : _isHovering[1] = false;
                      });
                    },
                    onTap: () {
                      Provider.of<NavigationProvider>(context, listen: false)
                          .setIndex(1);
                    },
                    child: CustomNavBarWidget("Calender",
                        mediaQueryData: mediaQueryData,
                        isHovering: _isHovering[1]),
                  ),
                  SizedBox(
                    width: mediaQueryData.size.width * 0.03,
                  ),
                  InkWell(
                    onHover: (value) {
                      setState(() {
                        value ? _isHovering[2] = true : _isHovering[2] = false;
                      });
                    },
                    onTap: () {
                      Provider.of<NavigationProvider>(context, listen: false)
                          .setIndex(2);
                    },
                    child: CustomNavBarWidget("Chat",
                        mediaQueryData: mediaQueryData,
                        isHovering: _isHovering[2]),
                  ),
                  SizedBox(
                    width: mediaQueryData.size.width * 0.03,
                  ),
                  InkWell(
                    onHover: (value) {
                      setState(() {
                        value ? _isHovering[3] = true : _isHovering[3] = false;
                      });
                    },
                    onTap: () {
                      Provider.of<NavigationProvider>(context, listen: false)
                          .setIndex(3);
                    },
                    child: CustomNavBarWidget("Profile",
                        mediaQueryData: mediaQueryData,
                        isHovering: _isHovering[3]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
