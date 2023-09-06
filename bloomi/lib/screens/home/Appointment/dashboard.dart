import 'package:flutter/material.dart';
import 'package:bloomi/components/custom_text.dart';
import 'package:bloomi/utils/util_constant.dart';
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
  @override
  initState() {
    // at the beginning, all users are shown
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            color: Color.fromARGB(255, 163, 220, 248),
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

                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    autofocus: true,
                    //onChanged: (value) => _runFilter(value),
                    decoration: InputDecoration(
                        labelText: 'Search', suffixIcon: Icon(Icons.search)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                /*
                Expanded(
                  child: _foundUsers.isNotEmpty
                      ? ListView.builder(
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
                      : Text(
                          'No results found',
                          style: TextStyle(fontSize: 24),
                        ),
                ),*/
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
    );
  }
}
