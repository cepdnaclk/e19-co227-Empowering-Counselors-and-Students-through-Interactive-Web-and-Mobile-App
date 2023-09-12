import 'package:bloomi_web/components/custom_navbar_widget.dart';
import 'package:bloomi_web/providers/nav_provider/navigation_provider.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopBarContents extends StatefulWidget {
  const TopBarContents({super.key});

  @override
  State<TopBarContents> createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  final List _isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
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
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  SizedBox(
                    width: screenSize.width * 0.02,
                  ),
                  InkWell(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Icon(
                      Icons.menu,
                      size: screenSize.width * 0.02,
                    ),
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
                          height: screenSize.height * 0.03,
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
                      Provider.of<NavigationProvider>(context, listen: false)
                          .setIndex(1);
                    },
                    child: Column(
                      children: [
                        CustomNavBarWidget("Calender",
                            mediaQueryData: mediaQueryData,
                            isHovering: _isHovering[1]),
                        SizedBox(
                          height: screenSize.height * 0.03,
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
                          height: screenSize.height * 0.03,
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
            ),
          ],
        ),
      ),
    );
  }
}
