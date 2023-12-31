import 'package:bloomi_web/components/footer.dart';
import 'package:bloomi_web/controllers/auth_controller.dart';
import 'package:bloomi_web/models/objects.dart';
import 'package:bloomi_web/providers/admin/counselor_registration_provider.dart';
import 'package:bloomi_web/screens/counsellor_screens/dashboard/accepted_appointments_card.dart';
import 'package:bloomi_web/screens/counsellor_screens/dashboard/all_appointments_page.dart';
import 'package:bloomi_web/screens/counsellor_screens/dashboard/counselor_next_appointment.dart';
import 'package:bloomi_web/screens/counsellor_screens/dashboard/pending_appointments_card.dart';
import 'package:bloomi_web/screens/counsellor_screens/dashboard/user_details_dialog.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class DashboardTablet extends StatefulWidget {
  const DashboardTablet({super.key});

  @override
  State<DashboardTablet> createState() => _DashboardTabletState();
}

class _DashboardTabletState extends State<DashboardTablet> {
  final List<UserModel> _allUsers = [];

  List<UserModel> _foundUsers = [];

  @override
  void initState() {
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<UserModel> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user.name
                  .toLowerCase()
                  .startsWith(enteredKeyword.toLowerCase()) ||
              user.faculty.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Material(
              /*borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),*/
              color: UtilConstants.canvasColor,
              child: Container(
                width: width,
                height: 150,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      UtilConstants.canvasColor,
                      UtilConstants.actionColor,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  /*borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),*/
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 20),
                            child: Consumer<CounsellorRegistrationProvider>(
                              builder: (context, value, child) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(width: 8),
                                    Text(
                                      "Hi, ${value.counsellorModel!.name} !",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          color: UtilConstants.whiteColor),
                                    ),
                                  ],
                                );
                              },
                            ),
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
                              color: UtilConstants.whiteColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: UtilConstants.greyColor,
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                            child: TextFormField(
                              onChanged: (value) {
                                _runFilter(value);
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search Students here",
                                hintStyle: TextStyle(
                                    color: UtilConstants.greyColor,
                                    fontSize: 15),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: UtilConstants.greyColor,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: StreamBuilder(
                stream: AuthController().getUsers(),
                builder: (context, snapshot) {
                  //-------if the snapshot error occurs, show error message-------
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text("Something went wrong"),
                    );
                  }

                  //-------if the snapshot is waiting, show progress indicator-------
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text("No Student found"),
                    );
                  }
                  Logger().i(snapshot.data!.docs.length);

                  //-------------clear the list before adding new data----------------
                  _allUsers.clear();

                  //-----------------read the document list from snapshot and map to model and add to list----------------
                  for (var e in snapshot.data!.docs) {
                    Map<String, dynamic> data =
                        e.data() as Map<String, dynamic>;
                    var model = UserModel.fromJson(data);
                    _allUsers.add(model);
                  }

                  return SizedBox(
                    height: 300,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _foundUsers.isNotEmpty
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  physics: const ScrollPhysics(),
                                  itemCount: _foundUsers.length,
                                  itemBuilder: (context, index) =>
                                      GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return UserDetailsDialog(
                                            uId: _foundUsers[index]
                                                .uid, // Replace with the actual user ID
                                            userName: _foundUsers[index]
                                                .name, // Replace with the actual username
                                          );
                                        },
                                      );
                                    },
                                    child: Card(
                                      key: ValueKey(_foundUsers[index].uid),
                                      color: UtilConstants.lightgreyColor,
                                      elevation: 4,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 10),
                                      child: ListTile(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 0, horizontal: 10),
                                        leading: CircleAvatar(
                                          radius: 18,
                                          backgroundImage: NetworkImage(
                                              _allUsers[index].imgUrl),
                                        ),
                                        title: Text(
                                          _foundUsers[index].name,
                                          style: const TextStyle(
                                              fontSize:
                                                  16), // Adjust the font size
                                        ),
                                        subtitle: Text(
                                          _foundUsers[index].email,
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : const Text(
                                  'No results found',
                                  style: TextStyle(fontSize: 16),
                                ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            width < 750
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: (Column(
                      children: [
                        NextAppointment(),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PendingAppointments(),
                            AcceptedAppointments(),
                          ],
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: Text(
                            "All Appointment",
                            style: TextStyle(
                              fontSize: 22,
                              color: UtilConstants.actionColor.withOpacity(0.9),
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  offset: const Offset(2, 2),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 500,
                          child: AllAppointmentsCounselor(),
                        ),
                        /*Row(
                          children: [
                            SizedBox(
                              width: width - 40,
                              height: 60,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Navigate to all appointments page
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return const AllAppointmentsCounselor();
                                  }));
                                },
                                style: ElevatedButton.styleFrom(
                                    foregroundColor: UtilConstants.whiteColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    backgroundColor: const Color.fromARGB(
                                        255, 155, 172, 187) // Button color
                                    ),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Go to All Appointments",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black, // Text color
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      size: 18,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )*/
                      ],
                    )),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  NextAppointment(),
                                ],
                              ),
                            ),
                            Column(
                              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                PendingAppointments(),
                                SizedBox(height: 35),
                                AcceptedAppointments(),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Center(
                          child: Text(
                            "All Appointment",
                            style: TextStyle(
                              fontSize: 22,
                              color: UtilConstants.actionColor.withOpacity(0.9),
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  offset: const Offset(2, 2),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                            height: 500, child: AllAppointmentsCounselor()),
                      ],
                    ),
                  ),
            const SizedBox(height: 20),
            Footer(height: 55, width: width),
          ],
        ),
      ),
    );
  }
}
