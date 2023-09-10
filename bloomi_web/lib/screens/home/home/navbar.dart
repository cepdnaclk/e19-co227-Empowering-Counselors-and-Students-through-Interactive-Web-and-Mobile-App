import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/components/drawer.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class HomeNavBar extends StatefulWidget {
  const HomeNavBar({Key? key}) : super(key: key);

  @override
  State<HomeNavBar> createState() => _HomeNavBarState();
}

class _HomeNavBarState extends State<HomeNavBar> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<bool> _isHovering = List.generate(4, (_) => false);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          automaticallyImplyLeading:
              mediaQueryData.size.width > 900 ? false : true,
          backgroundColor: UtilConstants.lightgreyColor,
          title: const Row(
            children: [
              Text(
                "BLOOMi",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: UtilConstants.primaryColor),
              ),
            ],
          ),
        ),
        drawer: mediaQueryData.size.width > 900 ? null : const MyDrawer(),
        body: const CustomText("Home"));
  }
}
