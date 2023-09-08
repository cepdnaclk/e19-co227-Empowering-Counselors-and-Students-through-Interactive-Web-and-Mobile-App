import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

import 'new_appointment.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // This holds a list of fiction users
  // You can use data fetched from a database or a server as well
  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "Andy", "age": 29},
    {"id": 2, "name": "Aragon", "age": 40},
    {"id": 3, "name": "Bob", "age": 5},
    {"id": 4, "name": "Barbara", "age": 35},
    {"id": 5, "name": "Candy", "age": 21},
    {"id": 6, "name": "Colin", "age": 55},
    {"id": 7, "name": "Audra", "age": 30},
    {"id": 8, "name": "Banana", "age": 14},
    {"id": 9, "name": "Caversky", "age": 100},
    {"id": 10, "name": "Becky", "age": 32},
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  bool _isSearchBarTapped = false; // Added flag

  @override
  void initState() {
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];

    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
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
    //final currentWidth = MediaQuery.of(context).size.width;

    /*return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            color:const  Color.fromARGB(255, 163, 220, 248),
            child: const Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Dashboard",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                /*SizedBox(
                  width: 580,
                  child: Card(
                      child: Center(
                    child: Column(children: [
                      ListTile(
                          title: Text(
                        "My Appointment",
                      )),
                      Text("text", style: TextStyle(fontSize: 20)),
                      Text("data", style: TextStyle(fontSize: 20))
                    ]),
                  )),
                ),
                
                */

                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    autofocus: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Search your records',
                      suffixIcon: Icon(Icons.search),
                    ),
                    /*onChanged: (value) => setState() {
                      _runFilter(value);
                    },*/
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: _foundUsers.isNotEmpty
                      ?ListView.builder(
                          itemCount: _foundUsers.length,
                          itemBuilder: (context, index) => Card(
                            key: ValueKey(_foundUsers[index]["id"]),
                            color: Colors.amberAccent,
                            elevation: 4,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: ListTile(
                              leading: Text(
                                _foundUsers[index]["id"].toString(),
                                style: const TextStyle(fontSize: 24),
                              ),
                              title: Text(_foundUsers[index]['name']),
                              subtitle: Text(
                                  '${_foundUsers[index]["age"].toString()} years old'),
                            ),
                          ),
                        )
                      : Center(
                          child: Text(
                            'No results found',
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                ),
                SizedBox(height: 20),
                Text(
                  "Your Next Appointment",
                  textAlign: TextAlign.left,
                ),
                Card(
                  elevation: 0,
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: SizedBox(
                    width: 300,
                    height: 100,
                    child: Center(child: Text('Filled Card')),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            right: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                UtilConstants.profImagePath,
                width: 60,
                height: 60,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const Appointment()));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );*/

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 163, 220, 248),
      body: SafeArea(
        child: GestureDetector(
          onTap: _closeDropdown,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Dashboard",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Spacer(), // Added Spacer to push the Container to the right
                    Container(
                      alignment: Alignment.topRight,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset(
                          UtilConstants.profImagePath,
                          width: 60,
                          height: 60,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: TextField(
                    onChanged: (value) => _runFilter(value),
                    onTap: () {
                      setState(() {
                        _isSearchBarTapped =
                            true; // Update flag when search bar is tapped
                      });
                    },
                    decoration: const InputDecoration(
                        labelText: 'Search your records',
                        suffixIcon: Icon(Icons.search)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: _isSearchBarTapped
                        ? _foundUsers.isNotEmpty
                            ? ListView.builder(
                                itemCount: _foundUsers.length,
                                itemBuilder: (context, index) => Card(
                                  key: ValueKey(_foundUsers[index]["id"]),
                                  color: Colors.amberAccent,
                                  elevation: 4,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: ListTile(
                                    leading: Text(
                                      _foundUsers[index]["id"].toString(),
                                      style: const TextStyle(fontSize: 24),
                                    ),
                                    title: Text(_foundUsers[index]['name']),
                                    subtitle: Text(
                                        '${_foundUsers[index]["age"].toString()} years old'),
                                  ),
                                ),
                              )
                            : const Text(
                                'No results found',
                                style: TextStyle(fontSize: 24),
                              )
                        : Container()),
                const Text(
                  "Your Next Appointment",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                    bottom: 30,
                    left: 20,
                    right: 20,
                  ),
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Title',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                              height: 8,
                              child: Divider(
                                thickness: 1,
                              )),
                          Text('Full Name:'),
                          SizedBox(height: 4),
                          Text('Email:'),
                          SizedBox(height: 4),
                          Text('Counsellor:'),
                          SizedBox(height: 4),
                          Text('Date:'),
                          SizedBox(height: 4),
                          Text('Time:'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const Appointment()));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
