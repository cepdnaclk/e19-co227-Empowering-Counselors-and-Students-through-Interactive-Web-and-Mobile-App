import 'package:bloomi_web/controllers/auth_controller.dart';
import 'package:bloomi_web/models/objects.dart';
import 'package:bloomi_web/utils/util_form_method.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class UserListView extends StatefulWidget {
  const UserListView({
    super.key,
  });
  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  final List<UserModel> _listUser = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<UserModel> _filteredUsers(String query) {
    return _listUser.where((user) {
      final name = user.name.toLowerCase();
      return name.contains(query.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _searchController,
            onChanged: (query) {
              setState(() {});
            },
            decoration: InputDecoration(
              hintText: 'Search by name...',
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
              ),
              fillColor: Colors.white,
              filled: true,
            ),
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
        SingleChildScrollView(
          child: StreamBuilder(
            stream: AuthController().getUsers(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text("Something went wrong"),
                );
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.data!.docs.isEmpty) {
                return const Center(
                  child: Text("No Counsellor found"),
                );
              }

              Logger().i(snapshot.data!.docs.length);

              _listUser.clear();

              for (var e in snapshot.data!.docs) {
                Map<String, dynamic> data = e.data() as Map<String, dynamic>;
                var model = UserModel.fromJson(data);
                _listUser.add(model);
              }

              final usersToDisplay = _searchController.text.isNotEmpty
                  ? _filteredUsers(_searchController.text)
                  : _listUser;

              return ListView.builder(
                itemCount: usersToDisplay.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      tileColor: Colors.white,
                      title: Text(
                        usersToDisplay[index].name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                          shadows: [
                            Shadow(
                              blurRadius: 3.0,
                              color: Colors.grey,
                              offset: Offset(2.0, 2.0),
                            ),
                          ],
                        ),
                      ),
                      subtitle: Text(
                        usersToDisplay[index].userCredential,
                        style: const TextStyle(
                          fontSize: 16,
                          shadows: [
                            Shadow(
                              blurRadius: 2.0,
                              color: Colors.grey,
                              offset: Offset(1.0, 1.0),
                            ),
                          ],
                        ),
                      ),
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(usersToDisplay[index].imgUrl),
                        radius: 30,
                      ),
                      trailing: Tooltip(
                        message: "Add Appointment",
                        child: Ink(
                          decoration: const ShapeDecoration(
                            color: Colors.blueGrey,
                            shape: CircleBorder(),
                          ),
                          child: IconButton(
                            onPressed: () => UtilFormMethod.showDialogMethod(
                              context,
                              usersToDisplay[index].uid,
                              usersToDisplay[index].name,
                              usersToDisplay[index].email,
                            ),
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
