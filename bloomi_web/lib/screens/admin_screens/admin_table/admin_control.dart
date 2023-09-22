// ignore_for_file: non_constant_identifier_names

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
  List<bool> isRowHovered = [];
  List<bool> isRowHoveredDeleted = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var width = mediaQueryData.size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
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
                  // Initialize the lists based on the length of allAdminModel
                  isRowHovered = List.generate(
                      value.allAdminModel.length, (index) => false);
                  isRowHoveredDeleted = List.generate(
                      value.allAdminModel.length, (index) => false);

                  return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: DataTable(
                          dataRowMinHeight: 50,
                          dataRowMaxHeight: 50,
                          dataTextStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          columnSpacing: (width * 1 / 20),
                          columns: [
                            DataColumn(
                                label: Center(
                              child: Text(
                                'Admin Id',
                                style: TextStyle(
                                    color: UtilConstants.greenColor,
                                    fontSize: 20),
                              ),
                            )),
                            DataColumn(
                                label: Text(
                              'Name',
                              style: TextStyle(
                                  color: UtilConstants.greenColor,
                                  fontSize: 20),
                            )),
                            DataColumn(
                                label: Text(
                              'Email',
                              style: TextStyle(
                                  color: UtilConstants.greenColor,
                                  fontSize: 20),
                            )),
                            DataColumn(
                                label: Text(
                              'Contact Number',
                              style: TextStyle(
                                  color: UtilConstants.greenColor,
                                  fontSize: 20),
                            )),
                            // Tableheads(text: 'Faculty'),
                            DataColumn(
                                label: Text(
                              'Faculty',
                              style: TextStyle(
                                  color: UtilConstants.greenColor,
                                  fontSize: 20),
                            )),
                            DataColumn(
                                label: Text(
                              'Actions',
                              style: TextStyle(
                                  color: UtilConstants.greenColor,
                                  fontSize: 20),
                            )),
                          ],
                          rows: List.generate(
                            value.allAdminModel.length,
                            (index) {
                              return DataRow(
                                cells: [
                                  DataCell(
                                    Text(
                                      value.allAdminModel[index].uid,
                                    ),
                                  ),
                                  DataCell(
                                      Text(value.allAdminModel[index].name)),
                                  DataCell(
                                      Text(value.allAdminModel[index].email)),
                                  DataCell(
                                      Text(value.allAdminModel[index].phone)),
                                  DataCell(Text(value
                                      .allAdminModel[index].userCredential)),
                                  DataCell(
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
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
                                                  backgroundColor:
                                                      isRowHovered[index]
                                                          ? Colors.greenAccent
                                                          : Colors.grey.shade50,
                                                ),
                                                child: Text(
                                                  'Update',
                                                  style: TextStyle(
                                                    color: isRowHovered[index]
                                                        ? Colors.black
                                                        : Colors
                                                            .purple.shade400,
                                                  ),
                                                )),
                                          ),
                                          MouseRegion(
                                            onEnter: (_) {
                                              setState(() {
                                                isRowHoveredDeleted[index] =
                                                    true;
                                              });
                                            },
                                            onExit: (_) {
                                              setState(() {
                                                isRowHoveredDeleted[index] =
                                                    false;
                                              });
                                            },
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    isRowHoveredDeleted[index]
                                                        ? Colors
                                                            .redAccent.shade200
                                                        : Colors.grey.shade50,
                                              ),
                                              child: Text(
                                                'Delete',
                                                style: TextStyle(
                                                  color:
                                                      isRowHoveredDeleted[index]
                                                          ? Colors.black
                                                          : Colors
                                                              .purple.shade400,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          )));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
