import 'package:bloomi_web/components/custom_tablecells.dart';
import 'package:bloomi_web/components/custom_tableheads.dart';
import 'package:bloomi_web/providers/user_home_provider/user_appoinment_provider.dart';
import 'package:bloomi_web/screens/admin_screens/registration%20_forms/studentform.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:bloomi_web/utils/util_function.dart';
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Studentform(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                  padding: const EdgeInsets.all(20),
                ),
                child: const Text(
                  'Add Student',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Consumer<UserAppoinmentProvider>(
              builder: (context, value, child) {
                isRowHovered = List.generate(
                    value.allStudentModel.length, (index) => false);
                isRowHoveredDeleted = List.generate(
                    value.allStudentModel.length, (index) => false);
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Table(
                    columnWidths: const <int, TableColumnWidth>{
                      0: FlexColumnWidth(1.0),
                      1: FlexColumnWidth(1.0),
                      2: FlexColumnWidth(1.1),
                      3: FlexColumnWidth(1.0),
                      4: FlexColumnWidth(0.6),
                      5: FlexColumnWidth(0.95),
                    },
                    border: TableBorder.all(
                      width: 1.5,
                      color: UtilConstants.primaryColor,
                    ),
                    children: [
                      const TableRow(children: [
                        Tableheads(text: 'Name'),
                        Tableheads(text: 'Email'),
                        Tableheads(text: 'Phone'),
                        Tableheads(text: 'Department'),
                        Tableheads(text: 'Faculty'),
                        Tableheads(text: 'Year'),
                        Tableheads(text: 'Controls'),
                      ]),
                      ...List.generate(
                        value.allStudentModel.length,
                        (index) => TableRow(
                          children: [
                            Tablecellwidget(
                                name: value.allStudentModel[index].name),
                            Tablecellwidget(
                                name: value.allStudentModel[index].email),
                            Tablecellwidget(
                                name: value.allStudentModel[index].phone),
                            Tablecellwidget(
                                name: value.allStudentModel[index].faculty),
                            Tablecellwidget(
                                name: value.allStudentModel[index].department),
                            Tablecellwidget(
                                name: value.allStudentModel[index].year),
                            TableCell(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    MouseRegion(
                                      onEnter: (_) {
                                        setState(() {
                                          isRowHovered[index] = true;
                                        });
                                      },
                                      onExit: (_) {
                                        setState(() {
                                          isRowHovered[index] = false;
                                        });
                                      },
                                      child: ElevatedButton(
                                          onPressed: () {
                                            UtilFunction.navigateForward(
                                              context,
                                              const Studentform(),
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: isRowHovered[index]
                                                ? Colors.greenAccent
                                                : Colors.grey.shade50,
                                          ),
                                          child: Text(
                                            'Update',
                                            style: TextStyle(
                                              color: isRowHovered[index]
                                                  ? Colors.black
                                                  : Colors.purple.shade400,
                                            ),
                                          )),
                                    ),
                                    MouseRegion(
                                      onEnter: (_) {
                                        setState(() {
                                          isRowHoveredDeleted[index] = true;
                                        });
                                      },
                                      onExit: (_) {
                                        setState(() {
                                          isRowHoveredDeleted[index] = false;
                                        });
                                      },
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              isRowHoveredDeleted[index]
                                                  ? Colors.redAccent.shade200
                                                  : Colors.grey.shade50,
                                        ),
                                        child: Text(
                                          'Delete',
                                          style: TextStyle(
                                            color: isRowHoveredDeleted[index]
                                                ? Colors.black
                                                : Colors.purple.shade400,
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
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
