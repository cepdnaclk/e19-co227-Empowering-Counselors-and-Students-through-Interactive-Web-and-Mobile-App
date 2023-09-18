import 'package:bloomi_web/components/custom_card_widget.dart';
import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/providers/user_home_provider/user_appoinment_provider.dart';
import 'package:bloomi_web/providers/users/user_provider.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserAppointmentDashboard extends StatefulWidget {
  const UserAppointmentDashboard({Key? key}) : super(key: key);

  @override
  State<UserAppointmentDashboard> createState() =>
      _UserAppointmentDashboardState();
}

class _UserAppointmentDashboardState extends State<UserAppointmentDashboard> {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final currentWidth = mediaQueryData.size.width;

    List<String> name = ["Dr. A", "Dr. B"];
    List<String> credential = ["PhD", "PhD"];
    List<String> uid = ["1", "2"];
    return Scaffold(
      body: SafeArea(
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
                              radius: ((currentWidth > 900) ? 25 : 20),
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
                        child: Consumer<UserAppoinmentProvider>(
                          builder: (context, value, child) {
                            return ListView.builder(
                              itemCount: 2, // Use the length of the list
                              itemBuilder: (context, index) {
                                return Card(
                                  color: UtilConstants.lightgreyColor,
                                  elevation: 4,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: ListTile(
                                    leading: Text(
                                      uid[index],
                                      style: const TextStyle(fontSize: 24),
                                    ),
                                    title: Text(name[index]),
                                    subtitle: Text(credential[index]),
                                  ),
                                );
                              },
                            );
                          },
                        )),
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
                    Expanded(
                      child: CustomCardWidget(),
                    ),
                    Expanded(
                      child: CustomCardWidget(),
                    ),
                    Expanded(
                      child: CustomCardWidget(),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
