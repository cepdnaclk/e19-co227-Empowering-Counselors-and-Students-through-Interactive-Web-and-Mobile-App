import 'package:bloomi_web/components/custom_card_widget.dart';
import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/providers/users/user_provider.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserAppoinmentDashboard extends StatefulWidget {
  const UserAppoinmentDashboard({Key? key}) : super(key: key);

  @override
  State<UserAppoinmentDashboard> createState() =>
      _UserAppoinmentDashboardState();
}

class _UserAppoinmentDashboardState extends State<UserAppoinmentDashboard> {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final currentWidth = mediaQueryData.size.width;
    final List<String> id = ["1", "2"];
    final List<String> names = ["Sachith Dissanayaka", "Sachith Dissanayaka"];
    return Scaffold(
      backgroundColor: UtilConstants.homeBackgroundColor,
      body: SafeArea(
        child: GestureDetector(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 10.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Available Counsellors",
                          style: TextStyle(
                            fontSize: (currentWidth < 900) ? 20 : 30,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Consumer<UserProvider>(
                        builder: (context, value, child) {
                          return Container(
                            alignment: Alignment.topRight,
                            child: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(value.userModel!.imgUrl),
                              radius: ((currentWidth > 900) ? 30 : 20),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      height: 300,
                      width: 1000,
                      child: Expanded(
                          child: (SizedBox(
                        child: SizedBox(
                          child: ListView.builder(
                            itemCount: 2,
                            itemBuilder: (context, index) => Card(
                              color: UtilConstants.primaryColor,
                              elevation: 4,
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: ListTile(
                                leading: Text(
                                  id[index],
                                  style: const TextStyle(fontSize: 24),
                                ),
                                title: Text(names[index]),
                                subtitle: const Text("Hiii"),
                              ),
                            ),
                          ),
                        ),
                      ))),
                    ),
                  ),
                ),
                const CustomText(
                  "Your Appointment",
                  fontColor: Colors.blueGrey,
                  fontSize: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 300,
                      child: CustomCardWidget(),
                    ),
                    SizedBox(
                      width: 300,
                      child: CustomCardWidget(),
                    ),
                    SizedBox(
                      width: 300,
                      child: CustomCardWidget(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
