import 'package:bloomi_web/components/custom_tablecells.dart';
import 'package:bloomi_web/components/custom_tableheads.dart';
import 'package:bloomi_web/providers/user_home_provider/user_appoinment_provider.dart';
import 'package:bloomi_web/screens/admin_screens/registration%20_forms/counselorform.dart';
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
  List<String> faculties = [
    'Faculty of Medicine',
    'Faculty of Dental Sciences',
    'Faculty of Veterinary Medicine and Animal Science',
    'Faculty of Science',
    'Faculty of Agriculture',
    'Faculty of Allied Health Sciences',
    'Faculty of Arts',
    'Faculty of Management',
    'Faculty of Engineering',
    'Faculty of Medicine',
  ];

  List<String> studentyear = [
    '1st Year',
    '2nd Year',
    '3rd Year',
    '4th Year',
    '1st Year',
    '2nd Year',
    '3rd Year',
    '4th Year',
    '1st Year',
    '2nd Year',
  ];
  List<String> studentnames = [
    "John Doe",
    "Alice Johnson",
    "Michael Smith",
    "Emily Brown",
    "Daniel Wilson",
    "Olivia Garcia",
    "David Lee",
    "Sophia Taylor",
    "Ethan Martinez",
    "Ava Anderson"
  ];
  List<String> departments = [
    "Computer Department",
    " Electrical Department",
    "Mechanical Department",
    "Civil Department",
    " Chemical Department",
    "Computer Department",
    " Electrical Department",
    "Mechanical Department",
    "Civil Department",
    " Chemical Department",
  ];
  List<String> emails = [
    "john.doe@email.com",
    "susan.smith@email.com",
    "michael.johnson@email.com",
    "lisa.wilson@email.com",
    "david.brown@email.com",
    "emily.miller@email.com",
    "robert.jones@email.com",
    "sarah.davis@email.com",
    "jennifer.wang@email.com",
    "william.chen@email.com"
  ];
  List<bool> isRowHovered = List.generate(10, (index) => false);
  List<bool> isRowHoveredDeleted = List.generate(10, (index) => false);

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
                      for (int index = 0;
                          index < value.allStudentModel.length;
                          index++)
                        TableRow(
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
                                              const Counselorform(),
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
