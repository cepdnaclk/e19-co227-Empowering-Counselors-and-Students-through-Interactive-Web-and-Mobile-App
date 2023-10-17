import 'package:bloomi_web/components/footer.dart';
import 'package:bloomi_web/controllers/auth_controller.dart';
import 'package:bloomi_web/models/objects.dart';
import 'package:bloomi_web/screens/counsellor_screens/dashboard/counselor_next_appointment.dart';
import 'package:bloomi_web/screens/counsellor_screens/dashboard/user_details_dialog.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class Desktop extends StatefulWidget {
  const Desktop({super.key});

  @override
  State<Desktop> createState() => _DesktopState();
}

class _DesktopState extends State<Desktop> {
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
              user.email.toLowerCase().startsWith(enteredKeyword.toLowerCase()))
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
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 10),
                    child: Text(
                      "Dashboard",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Colors.grey.withOpacity(0.5),
                              offset: Offset(2, 2),
                              blurRadius: 4,
                            ),
                          ],
                          fontSize: 30,
                          color: UtilConstants.actionColor.withOpacity(0.9)),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: width * 0.5,
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: UtilConstants.lightgreyColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: 200,
                              height: 150,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "No of Appointments",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        shadows: [
                                          Shadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            offset: Offset(2, 2),
                                            blurRadius: 4,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      "10",
                                      style: TextStyle(
                                        fontSize: 16,
                                        shadows: [
                                          Shadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            offset: Offset(2, 2),
                                            blurRadius: 4,
                                          ),
                                        ],
                                      ),
                                    ), // get from DB
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: UtilConstants.lightgreyColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: 200,
                              height: 150,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "No of Students",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        shadows: [
                                          Shadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            offset: Offset(2, 2),
                                            blurRadius: 4,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      "10",
                                      style: TextStyle(
                                        fontSize: 16,
                                        shadows: [
                                          Shadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            offset: Offset(2, 2),
                                            blurRadius: 4,
                                          ),
                                        ],
                                      ),
                                    ), // get from DB
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Your Next Appointment",
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: UtilConstants.actionColor
                                          .withOpacity(0.9),
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          offset: Offset(2, 2),
                                          blurRadius: 4,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  const NextAppointment(),
                                  const SizedBox(height: 20),
                                ]),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.764,
                        width: width / 3,
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(
                                  top: 20, left: 20, right: 20),
                              padding: const EdgeInsets.only(
                                bottom: 3,
                              ),
                              width: width / 3,
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
                                  hintText: "Search here ",
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
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 10),
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
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
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
                                    height: height * 0.65,
                                    width: width / 3,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          _foundUsers.isNotEmpty
                                              ? ListView.builder(
                                                  shrinkWrap: true,
                                                  physics:
                                                      const ScrollPhysics(),
                                                  itemCount: _foundUsers.length,
                                                  itemBuilder:
                                                      (context, index) =>
                                                          InkWell(
                                                    highlightColor:
                                                        UtilConstants
                                                            .lightgreyColor,
                                                    onTap: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return UserDetailsDialog(
                                                            uId: _foundUsers[
                                                                    index]
                                                                .uid, // Replace with the actual user ID
                                                            userName: _foundUsers[
                                                                    index]
                                                                .name, // Replace with the actual username
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child: Card(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      key: ValueKey(
                                                          _foundUsers[index]
                                                              .uid),
                                                      color: UtilConstants
                                                          .lightgreyColor,
                                                      elevation: 4,
                                                      margin: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 5,
                                                          horizontal: 5),
                                                      child: ListTile(
                                                        key: ValueKey(
                                                            _foundUsers[index]
                                                                .uid),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                vertical: 0,
                                                                horizontal: 10),
                                                        leading: CircleAvatar(
                                                          radius: 18,
                                                          backgroundImage:
                                                              NetworkImage(
                                                                  _allUsers[
                                                                          index]
                                                                      .imgUrl),
                                                        ),
                                                        title: Text(
                                                          _foundUsers[index]
                                                              .name,
                                                          style: const TextStyle(
                                                              fontSize:
                                                                  16), // Adjust the font size
                                                        ),
                                                        subtitle: Text(
                                                          _foundUsers[index]
                                                              .email,
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 14),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : const Center(
                                                  child: Text(
                                                    'No results found',
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  ),
                                                ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Footer(height: 55, width: width)
            ],
          ),
        ),
      ),
    );
  }
}
