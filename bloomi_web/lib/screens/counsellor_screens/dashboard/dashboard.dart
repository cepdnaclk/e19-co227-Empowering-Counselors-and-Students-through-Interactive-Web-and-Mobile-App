import 'package:bloomi_web/controllers/auth_controller.dart';
import 'package:bloomi_web/models/objects.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // This holds a list of fiction users
  // You can use data fetched from a database or a server as well
  /*final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "Andy", "age": 29},
    {"id": 2, "name": "Aragon", "age": 21},
    {"id": 3, "name": "Bob", "age": 5},
    {"id": 4, "name": "Barbara", "age": 35},
    {"id": 5, "name": "Candy", "age": 21},
    {"id": 6, "name": "Colin", "age": 23},
    {"id": 7, "name": "Audra", "age": 30},
    {"id": 8, "name": "Banana", "age": 14},
    {"id": 9, "name": "Caversky", "age": 24},
    {"id": 10, "name": "Becky", "age": 32},
  ];*/
  final List<UserModel> _allUsers = [];

  // This list holds the data for the list view
  //List<Map<String, dynamic>> _foundUsers = [];
  List<UserModel> _foundUsers = [];
  final List<UserModel> _selectedUser = [];
  bool _isSearchBarTapped = false; // Added flag

  @override
  void initState() {
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    //List<Map<String, dynamic>> results = [];
    List<UserModel> results = [];

    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user.name.toLowerCase().contains(enteredKeyword.toLowerCase()) ||
              user.faculty.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  void _closeDropdown() {
    setState(() {
      _isSearchBarTapped = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final currentWidth = mediaQueryData.size.width;
    final currentHeight = mediaQueryData.size.height;
    print(currentWidth);

    return StreamBuilder(
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
            Map<String, dynamic> data = e.data() as Map<String, dynamic>;
            var model = UserModel.fromJson(data);
            _allUsers.add(model);
          }

          return Scaffold(
            backgroundColor: UtilConstants.homeBackgroundColor,
            body: SafeArea(
              child: GestureDetector(
                onTap: () => setState(() {
                  _isSearchBarTapped = false;
                }),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 10.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Dashboard",
                              style: TextStyle(
                                fontSize: (currentWidth < 900) ? 20 : 30,
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            alignment: Alignment.topRight,
                            child: CircleAvatar(
                              backgroundImage: const NetworkImage(
                                  UtilConstants.profImagePath),
                              radius: ((currentWidth < 900) ? 20 : 30),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: (currentWidth < 900) ? 27 : 35,
                        margin: currentWidth > 500
                            ? (const EdgeInsets.symmetric(horizontal: 100))
                            : const EdgeInsets.symmetric(horizontal: 30),
                        child: TextField(
                          onTap: () {
                            setState(() {
                              _isSearchBarTapped = true;
                            });
                          },
                          onChanged: (value) => _runFilter(value),
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.only(bottom: 10.0, left: 10),
                            filled: true,
                            fillColor: UtilConstants.lightgreyColor,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              gapPadding: 8,
                              borderSide: BorderSide.none,
                            ),
                            labelText: 'Select a Student',
                            labelStyle: TextStyle(
                                color: UtilConstants.primaryColor,
                                fontSize: (currentWidth < 900) ? 12 : 16),
                            suffixIcon: Icon(
                              Icons.search,
                              color: UtilConstants.primaryColor,
                              size: (currentWidth < 900) ? 12 : 16,
                            ),
                          ),
                          style: TextStyle(
                              fontSize: (currentWidth < 900)
                                  ? 12
                                  : 16), // Set font size for the content
                          cursorWidth: 1.8, // Set cursor width
                          cursorHeight: (currentWidth < 900) ? 14 : 18,
                        ),
                      ),
                      SizedBox(
                        height: currentHeight * 0.015,
                      ),
                      Expanded(
                        child: _isSearchBarTapped
                            ? (_foundUsers.isNotEmpty
                                ? ListView.builder(
                                    itemCount: _foundUsers.length,
                                    itemBuilder: (context, index) => SizedBox(
                                      height:
                                          60, // Specify the desired height here
                                      child: Card(
                                        key: ValueKey(_foundUsers[index].uid),
                                        color: UtilConstants.lightgreyColor,
                                        elevation: 2,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 2, horizontal: 20),
                                        child: ListTile(
                                          onTap: () {
                                            setState(() {
                                              _selectedUser
                                                  .add(_foundUsers[index]);
                                              setState(() {
                                                _isSearchBarTapped = false;
                                              });
                                            });
                                            // Update next appointment field with relevant student's next appointment
                                          },
                                          leading: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                _allUsers[index].imgUrl),
                                          ),
                                          title: Text(
                                            _foundUsers[index].name,
                                            style: TextStyle(
                                                fontSize: (currentWidth < 750)
                                                    ? 10
                                                    : 15),
                                          ),
                                          subtitle: Text(
                                            _foundUsers[index].email,
                                            style: TextStyle(
                                                fontSize: (currentWidth < 750)
                                                    ? 10
                                                    : 15),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : Text(
                                    'No results found',
                                    style: TextStyle(
                                        fontSize:
                                            (currentWidth < 750) ? 10 : 15),
                                  ))
                            : Container(),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Container(
                            margin: const EdgeInsets.only(
                              top: 10,
                              bottom: 20,
                              //left: 20,
                              //right: 20,
                            ),
                            child: Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 20,
                                ),
                                child: currentWidth > 480
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Your Next Appointment",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: (currentWidth < 900)
                                                      ? 15
                                                      : 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: UtilConstants
                                                      .primaryColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text('Title',
                                              style: TextStyle(
                                                fontSize: (currentWidth < 900)
                                                    ? 15
                                                    : 18,
                                                fontWeight: FontWeight.bold,
                                              )),
                                          const SizedBox(
                                            height: 8,
                                            child: Divider(
                                              thickness: 1,
                                            ),
                                          ),
                                          Text('Full Name : ',
                                              style: TextStyle(
                                                  fontSize: (currentWidth < 900)
                                                      ? 12
                                                      : 15)),
                                          const SizedBox(height: 4),
                                          Text('Email:',
                                              style: TextStyle(
                                                  fontSize: (currentWidth < 900)
                                                      ? 12
                                                      : 15)),
                                          const SizedBox(height: 4),
                                          Text('Counsellor:',
                                              style: TextStyle(
                                                  fontSize: (currentWidth < 900)
                                                      ? 12
                                                      : 15)),
                                          const SizedBox(height: 4),
                                          Text('Date:',
                                              style: TextStyle(
                                                  fontSize: (currentWidth < 900)
                                                      ? 12
                                                      : 15)),
                                          const SizedBox(height: 4),
                                          Text('Time:',
                                              style: TextStyle(
                                                  fontSize: (currentWidth < 900)
                                                      ? 12
                                                      : 15)),
                                        ],
                                      )
                                    : SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Your Next Appointment",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize:
                                                        (currentWidth < 900)
                                                            ? 15
                                                            : 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: UtilConstants
                                                        .primaryColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Text('Title',
                                                style: TextStyle(
                                                  fontSize: (currentWidth < 900)
                                                      ? 15
                                                      : 18,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                            const SizedBox(
                                              height: 8,
                                              child: Divider(
                                                thickness: 1,
                                              ),
                                            ),
                                            Text('Full Name : ',
                                                style: TextStyle(
                                                    fontSize:
                                                        (currentWidth < 900)
                                                            ? 12
                                                            : 15)),
                                            const SizedBox(height: 4),
                                            Text('Email:',
                                                style: TextStyle(
                                                    fontSize:
                                                        (currentWidth < 900)
                                                            ? 12
                                                            : 15)),
                                            const SizedBox(height: 4),
                                            Text('Counsellor:',
                                                style: TextStyle(
                                                    fontSize:
                                                        (currentWidth < 900)
                                                            ? 12
                                                            : 15)),
                                            const SizedBox(height: 4),
                                            Text('Date:',
                                                style: TextStyle(
                                                    fontSize:
                                                        (currentWidth < 900)
                                                            ? 12
                                                            : 15)),
                                            const SizedBox(height: 4),
                                            Text('Time:',
                                                style: TextStyle(
                                                    fontSize:
                                                        (currentWidth < 900)
                                                            ? 12
                                                            : 15)),
                                          ],
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
