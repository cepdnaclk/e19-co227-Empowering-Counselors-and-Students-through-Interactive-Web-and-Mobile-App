import 'package:bloomi_web/components/custom_navbar_widget.dart';
import 'package:bloomi_web/providers/nav_provider/navigation_provider.dart';
import 'package:bloomi_web/screens/home_screens/chat/home/chat.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:bloomi_web/utils/util_function.dart';
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
                      UtilFunction.navigateForward(context, const Chat());
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
