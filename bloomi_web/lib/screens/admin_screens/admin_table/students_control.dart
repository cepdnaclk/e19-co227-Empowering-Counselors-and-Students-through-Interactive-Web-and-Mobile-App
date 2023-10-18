import 'package:bloomi_web/controllers/auth_controller.dart';
import 'package:bloomi_web/models/objects.dart';
import 'package:bloomi_web/utils/util_admin_functions.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class StudentControl extends StatefulWidget {
  const StudentControl({super.key});

  @override
  State<StudentControl> createState() => _StudentControlState();
}

class _StudentControlState extends State<StudentControl> {
  List<bool> isRowHovered = [];
  List<bool> isRowHoveredDeleted = [];
  final List<UserModel> _list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue.shade50,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
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
                        child: Text("No Users found"),
                      );
                    }

                    Logger().i(snapshot.data!.docs.length);

                    //-------------clear the list before adding new data----------------
                    _list.clear();

                    //-----------------read the document list from snapshot and map to model and add to list----------------
                    for (var e in snapshot.data!.docs) {
                      Map<String, dynamic> data =
                          e.data() as Map<String, dynamic>;
                      var model = UserModel.fromJson(data);
                      _list.add(model);
                    }

                    return DataTable(
                        sortAscending: true,
                        dataRowMinHeight: 50,
                        dataRowMaxHeight: 60,
                        dataTextStyle: TextStyle(
                          color: Colors.grey.shade900,
                        ),
                        columns: [
                          AdminFunctions.customDataColumns('Name'),
                          AdminFunctions.customDataColumns('Email'),
                          AdminFunctions.customDataColumns('Contacts'),
                          AdminFunctions.customDataColumns('Faculty'),
                          AdminFunctions.customDataColumns('Department'),
                          AdminFunctions.customDataColumns('Year'),
                        ],
                        rows: List.generate(
                          _list.length,
                          (index) {
                            return DataRow(
                              cells: [
                                AdminFunctions.customDatacells(
                                    _list[index].name),
                                AdminFunctions.customDatacells(
                                    _list[index].email),
                                AdminFunctions.customDatacells(
                                    _list[index].phone),
                                AdminFunctions.customDatacells(
                                    _list[index].faculty),
                                AdminFunctions.customDatacells(
                                    _list[index].department),
                                AdminFunctions.customDatacells(
                                    _list[index].year),
                              ],
                            );
                          },
                        ));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
