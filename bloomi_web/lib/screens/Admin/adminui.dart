//import 'package:bloomi_web/components/background_color_gradient.dart';
// import 'package:bloomi_web/components/custom_text.dart';
// import 'package:bloomi_web/components/drawer.dart';
// import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class Adminpanel extends StatefulWidget {
  const Adminpanel({Key? key}) : super(key: key);

  @override
  State<Adminpanel> createState() => _HomeNavBarState();
}

class _HomeNavBarState extends State<Adminpanel> {
  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  //final List<bool> _isHovering = List.generate(4, (_) => false);

  @override
  Widget build(BuildContext context) {
    // MediaQueryData mediaQueryData = MediaQuery.of(context);

    return const DefaultTabController(
      length: 6,
      child: Scaffold(
        body: Column(
          children: [
            //BackgroundColorGradient(),
            TabBar(
              labelColor: Colors.black,
              dividerColor: Color.fromARGB(255, 146, 192, 230),
              tabs: [
                Tab(
                  text: ('Home'),
                  icon: Icon(Icons.home),
                ),
                Tab(
                  text: 'Dashboard',
                  icon: Icon(Icons.dashboard),
                ),
                Tab(
                  text: 'Progress',
                  icon: Icon(Icons.add_chart),
                ),
                Tab(
                  text: 'Controls',
                  icon: Icon(Icons.add_card_sharp),
                ),
                Tab(
                  text: 'Profile',
                  icon: Icon(Icons.person),
                ),
                Tab(
                  text: 'Settings',
                  icon: Icon(Icons.settings),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
