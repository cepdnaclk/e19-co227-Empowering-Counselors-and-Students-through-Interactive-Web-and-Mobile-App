import 'package:bloomi_web/providers/user_home_provider/user_appoinment_provider.dart';
import 'package:bloomi_web/utils/util_admin_functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentControl extends StatefulWidget {
  const StudentControl({super.key});

  @override
  State<StudentControl> createState() => _StudentControlState();
}

class _StudentControlState extends State<StudentControl> {
  List<bool> isRowHovered = [];
  List<bool> isRowHoveredDeleted = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<UserAppoinmentProvider>(
              builder: (context, value, child) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: DataTable(
                      sortColumnIndex: 0,
                      sortAscending: true,
                      dataRowMinHeight: 50,
                      dataRowMaxHeight: 50,
                      dataTextStyle: TextStyle(
                        color: Colors.grey.shade900,
                      ),
                      columns: [
                        AdminFunctions.customDataColumns('Name'),
                        AdminFunctions.customDataColumns('Email'),
                        AdminFunctions.customDataColumns('Contact Number'),
                        AdminFunctions.customDataColumns('Faculty'),
                        AdminFunctions.customDataColumns('Department'),
                        AdminFunctions.customDataColumns('Year'),
                      ],
                      rows: List.generate(
                        value.allStudentModel.length,
                        (index) {
                          return DataRow(
                            cells: [
                              AdminFunctions.customDatacells(
                                  value.allStudentModel[index].name),
                              AdminFunctions.customDatacells(
                                  value.allStudentModel[index].email),
                              AdminFunctions.customDatacells(
                                  value.allStudentModel[index].phone),
                              AdminFunctions.customDatacells(
                                  value.allStudentModel[index].faculty),
                              AdminFunctions.customDatacells(
                                  value.allStudentModel[index].department),
                              AdminFunctions.customDatacells(
                                  value.allStudentModel[index].year),
                            ],
                          );
                        },
                      )),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
