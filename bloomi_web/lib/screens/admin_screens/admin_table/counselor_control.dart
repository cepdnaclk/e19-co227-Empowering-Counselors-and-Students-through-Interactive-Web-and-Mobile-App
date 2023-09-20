import 'package:bloomi_web/components/custom_tablecells.dart';
import 'package:bloomi_web/components/custom_tableheads.dart';
import 'package:bloomi_web/providers/user_home_provider/user_appoinment_provider.dart';
import 'package:bloomi_web/screens/admin_screens/registration%20_forms/counselorform.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:bloomi_web/utils/util_function.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counselorcontrol extends StatefulWidget {
  const Counselorcontrol({super.key});

  @override
  State<Counselorcontrol> createState() => _CounselorcontrolState();
}

class _CounselorcontrolState extends State<Counselorcontrol> {
  List<bool> isRowHovered = List.generate(2, (index) => false, growable: true);
  List<bool> isRowHoveredDeleted =
      List.generate(2, (index) => false, growable: true);
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
                  UtilFunction.navigateForward(
                    context,
                    const Counselorform(),
                  );
                },
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  padding: const EdgeInsets.all(20),
                ),
                child: const Text(
                  'Add Counselor',
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
                      0: FlexColumnWidth(0.8),
                      1: FlexColumnWidth(0.9),
                      2: FlexColumnWidth(1.1),
                      3: FlexColumnWidth(0.8),
                      4: FlexColumnWidth(1.2),
                      5: FlexColumnWidth(1.2),
                      6: FlexColumnWidth(1.2),
                    },
                    border: TableBorder.all(
                      width: 1.5,
                      color: UtilConstants.primaryColor,
                    ),
                    children: [
                      const TableRow(children: [
                        Tableheads(text: 'Counselor Id'),
                        Tableheads(text: 'Name'),
                        Tableheads(text: 'Email'),
                        Tableheads(text: 'Contact Nu.'),
                        Tableheads(text: 'Faculty'),
                        Tableheads(text: 'Credentials'),
                        Tableheads(text: 'Controls'),
                      ]),
                      for (int index = 0;
                          index < value.allCounselorModel.length;
                          index++)
                        TableRow(children: [
                          Tablecellwidget(
                            name: value.allCounselorModel[index].uid,
                          ),
                          Tablecellwidget(
                              name: value.allCounselorModel[index].name),
                          Tablecellwidget(
                              name: value.allCounselorModel[index].email),
                          Tablecellwidget(
                              name: value.allCounselorModel[index].phone),
                          Tablecellwidget(
                              name: value.allCounselorModel[index].faculty),
                          Tablecellwidget(
                              name: value
                                  .allCounselorModel[index].userCredential),
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
                        ]),
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
