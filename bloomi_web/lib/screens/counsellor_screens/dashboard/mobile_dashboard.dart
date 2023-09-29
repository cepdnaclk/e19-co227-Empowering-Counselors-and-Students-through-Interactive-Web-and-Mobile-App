import 'package:bloomi_web/providers/admin/counselor_registration_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardMobile extends StatefulWidget {
  const DashboardMobile({super.key});

  @override
  State<DashboardMobile> createState() => _DashboardMobileState();
}

class _DashboardMobileState extends State<DashboardMobile> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Consumer<CounsellorRegistrationProvider>(
      builder: (context, value, child) {
        return SafeArea(
          child: Material(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            color: canvasColor,
            child: SingleChildScrollView(
                child: Stack(
              children: [
                Container(
                  width: width,
                  height: height / 4,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        canvasColor,
                        actionColor,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        value.counsellorModel!.imgUrl),
                                    radius: (20),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Hi, " + value.counsellorModel!.name + " !",
                                    style:
                                        TextStyle(fontSize: 20, color: white),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30),
                              Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(
                                  right: 35,
                                  left: 35,
                                ),
                                padding: const EdgeInsets.only(
                                  bottom: 3,
                                ),
                                width: width * 0.6,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 6,
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  onChanged: (value) {},
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Search here ",
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 15),
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: Colors.grey,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
          ),
        );
      },
    );
  }
}

const primaryColor = Color(0xFF2E2E48);
const canvasColor = Color(0xFF272643);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color.fromARGB(255, 50, 50, 132).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);
