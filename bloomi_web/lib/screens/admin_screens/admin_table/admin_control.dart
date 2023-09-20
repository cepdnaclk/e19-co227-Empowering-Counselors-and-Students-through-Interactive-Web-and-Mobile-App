// ignore_for_file: non_constant_identifier_names

import 'package:bloomi_web/components/custom_tablecells.dart';
import 'package:bloomi_web/components/custom_tableheads.dart';
import 'package:bloomi_web/providers/user_home_provider/user_appoinment_provider.dart';
import 'package:bloomi_web/screens/admin_screens/registration%20_forms/adminform.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:bloomi_web/utils/util_function.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminControl extends StatefulWidget {
  const AdminControl({super.key});

  @override
  State<AdminControl> createState() => _AdminControlState();
}

class _AdminControlState extends State<AdminControl> {
  List<bool> isRowHovered = List.generate(20, (index) => false);
  List<bool> isRowHoveredDeleted = List.generate(20, (index) => false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: ElevatedButton(
                onPressed: () {
                  UtilFunction.navigateForward(
                    context,
                    const AdminRegistrationForm(),
                  );
                },
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  padding: const EdgeInsets.all(20),
                ),
                child: const Text(
                  'Add Admins',
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
                      0: FlexColumnWidth(1),
                      1: FlexColumnWidth(1),
                      2: FlexColumnWidth(1.1),
                      3: FlexColumnWidth(0.8),
                      4: FlexColumnWidth(1.2),
                      5: FlexColumnWidth(1.2),
                    },
                    border: TableBorder.all(
                      width: 1.5,
                      color: UtilConstants.primaryColor,
                    ),
                    children: [
                      const TableRow(children: [
                        Tableheads(text: 'Admin Id'),
                        Tableheads(text: 'Name'),
                        Tableheads(text: 'Email'),
                        Tableheads(text: 'Contact Nu.'),
                        // Tableheads(text: 'Faculty'),
                        Tableheads(text: 'Credentials'),
                        Tableheads(text: 'Controls'),
                      ]),
                      for (int index = 0;
                          index < value.allAdminModel.length;
                          index++)
                        TableRow(children: [
                          Tablecellwidget(name: value.allAdminModel[index].uid),
                          Tablecellwidget(
                              name: value.allAdminModel[index].name),
                          Tablecellwidget(
                              name: value.allAdminModel[index].email),
                          Tablecellwidget(
                              name: value.allAdminModel[index].phone),
                          // Tablecellwidget(name: faculties[index]),
                          Tablecellwidget(
                              name: value.allAdminModel[index].userCredential),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
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
                                            const AdminRegistrationForm(),
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
                        ]),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
