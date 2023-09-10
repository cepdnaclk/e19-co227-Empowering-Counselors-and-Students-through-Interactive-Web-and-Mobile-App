import 'package:bloomi_web/components/custom_navbar_widget.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class HomeNavBar extends StatefulWidget {
  const HomeNavBar({Key? key}) : super(key: key);

  @override
  State<HomeNavBar> createState() => _HomeNavBarState();
}

class _HomeNavBarState extends State<HomeNavBar> {
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
                    onTap: () {},
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
                      // Handle Home button tap
                    },
                    child: CustomNavBarWidget("Apointment",
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
                      // Handle Home button tap
                    },
                    child: CustomNavBarWidget("Contact",
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
                      // Handle Home button tap
                    },
                    child: CustomNavBarWidget("Relax",
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
