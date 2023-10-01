import 'package:bloomi_web/controllers/auth_controller.dart';
import 'package:bloomi_web/models/objects.dart';
import 'package:bloomi_web/providers/admin/counselor_registration_provider.dart';
import 'package:bloomi_web/screens/counsellor_screens/dashboard/user_details_dialog.dart';
import 'package:bloomi_web/utils/util_constant.dart';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class DashboardDesktop extends StatefulWidget {
  const DashboardDesktop({super.key});

  @override
  State<DashboardDesktop> createState() => _DashboardDesktopState();
}

class _DashboardDesktopState extends State<DashboardDesktop> {
  final List<UserModel> _allUsers = [];

  List<UserModel> _foundUsers = [];

  // Added flag

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

    return SafeArea(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Material(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: canvasColor,
              child: Container(
                width: width,
                height: 150,
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
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          value.counsellorModel!.imgUrl),
                                      radius: (20),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "Hi, ${value.counsellorModel!.name} !",
                                      style: const TextStyle(
                                          fontSize: 20, color: white),
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
                              onChanged: (value) {
                                _runFilter(value);
                              },
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search here ",
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 15),
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
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: height / 4),
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

                  return Column(
                    children: [
                      _foundUsers.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              itemCount: _foundUsers.length,
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SizedBox(
                                        width:
                                            400, // Adjust the width to your preference
                                        height:
                                            400, // Adjust the height to your preference
                                        child: UserDetailsDialog(
                                          uId: _foundUsers[index]
                                              .uid, // Replace with the actual user ID
                                          userName: _foundUsers[index]
                                              .name, // Replace with the actual username
                                        ),
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
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 10),
                                    leading: CircleAvatar(
                                      radius: 18,
                                      backgroundImage:
                                          NetworkImage(_allUsers[index].imgUrl),
                                    ),
                                    title: Text(
                                      _foundUsers[index].name,
                                      style: const TextStyle(
                                          fontSize: 16), // Adjust the font size
                                    ),
                                    subtitle: Text(
                                      _foundUsers[index].email,
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : const Center(
                              child: Text(
                                'No results found',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
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
