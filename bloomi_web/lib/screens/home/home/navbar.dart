import 'package:bloomi_web/components/custom_navbar_widget.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class HomeNavBar extends StatefulWidget {
  const HomeNavBar({Key? key}) : super(key: key);

  @override
  State<HomeNavBar> createState() => _HomeNavBarState();
}

class _HomeNavBarState extends State<HomeNavBar> {
  final List _isHovering = [
    false,
    false,
    false,
    false,
  ];
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Container(
      color: UtilConstants.lightgreyColor,
      child: Padding(
        padding: EdgeInsets.all(mediaQueryData.size.width * 0.01),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: mediaQueryData.size.width * 0.66,
                    height: mediaQueryData.size.height * 0.05,
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      UtilConstants.primaryImagePath,
                      width: mediaQueryData.size.width * 0.05,
                      height: mediaQueryData.size.height * 0.05,
                    ),
                  ),
                  Row(
                    children: [
                      InkWell(
                          onTap: () {},
                          onHover: (value) {
                            setState(() {
                              value
                                  ? _isHovering[0] = true
                                  : _isHovering[0] = false;
                            });
                          },
                          child: CustomNavBarWidget("Home",
                              mediaQueryData: mediaQueryData,
                              isHovering: _isHovering[0])),
                      SizedBox(width: mediaQueryData.size.width * 0.03),
                      InkWell(
                          onTap: () {},
                          onHover: (value) {
                            setState(() {
                              value
                                  ? _isHovering[1] = true
                                  : _isHovering[1] = false;
                            });
                          },
                          child: CustomNavBarWidget("Apoinment",
                              mediaQueryData: mediaQueryData,
                              isHovering: _isHovering[1])),
                      SizedBox(width: mediaQueryData.size.width * 0.03),
                      InkWell(
                          onTap: () {},
                          onHover: (value) {
                            setState(() {
                              value
                                  ? _isHovering[2] = true
                                  : _isHovering[2] = false;
                            });
                          },
                          child: CustomNavBarWidget("Contact",
                              mediaQueryData: mediaQueryData,
                              isHovering: _isHovering[2])),
                      SizedBox(width: mediaQueryData.size.width * 0.03),
                      InkWell(
                          onTap: () {},
                          onHover: (value) {
                            setState(() {
                              value
                                  ? _isHovering[3] = true
                                  : _isHovering[3] = false;
                            });
                          },
                          child: CustomNavBarWidget("Profile",
                              mediaQueryData: mediaQueryData,
                              isHovering: _isHovering[3])),
                    ],
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
