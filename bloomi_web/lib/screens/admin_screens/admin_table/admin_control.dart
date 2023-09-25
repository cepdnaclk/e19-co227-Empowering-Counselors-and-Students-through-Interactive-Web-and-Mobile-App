import 'package:bloomi_web/components/custom_control_buttons.dart';
import 'package:bloomi_web/controllers/admin_controller.dart';
import 'package:bloomi_web/models/objects.dart';
import 'package:bloomi_web/providers/admin/admin_registration_provider.dart';
import 'package:bloomi_web/screens/admin_screens/registration%20_forms/adminform.dart';
import 'package:bloomi_web/utils/util_admin_functions.dart';
import 'package:bloomi_web/utils/util_method.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class AdminControl extends StatefulWidget {
  const AdminControl({super.key});

  @override
  State<AdminControl> createState() => _AdminControlState();
}

class _AdminControlState extends State<AdminControl> {
  @override
  void initState() {
    super.initState();
  }

  final List<AdminModel> _list = [];
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var width = mediaQueryData.size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<AdminRegistrationProvider>(
              builder: (context, value, child) {
                // Initialize the lists based on the length of allAdminModel
                return Padding(
                    padding: const EdgeInsets.all(40),
                    child: Center(
                      child: StreamBuilder(
                        stream: AdminController().getAdmins(),
                        builder: (context, snapshot) {
                          //-------if the snapshot error occurs, show error message-------
                          if (snapshot.hasError) {
                            return const Center(
                              child: Text("Something went wrong"),
                            );
                          }

                          //-------if the snapshot is waiting, show progress indicator-------
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          if (snapshot.data!.docs.isEmpty) {
                            return const Center(
                              child: Text("No Admin found"),
                            );
                          }

                          Logger().i(snapshot.data!.docs.length);

                          //-------------clear the list before adding new data----------------
                          _list.clear();

                          //-----------------read the document list from snapshot and map to model and add to list----------------
                          for (var e in snapshot.data!.docs) {
                            Map<String, dynamic> data =
                                e.data() as Map<String, dynamic>;
                            var model = AdminModel.fromJson(data);
                            _list.add(model);
                          }

                          return DataTable(
                              sortColumnIndex: 0,
                              sortAscending: true,
                              dataRowMinHeight: 50,
                              dataRowMaxHeight: 50,
                              dataTextStyle: TextStyle(
                                color: Colors.grey.shade900,
                              ),
                              columnSpacing: (width * 1 / 15),
                              columns: [
                                AdminFunctions.customDataColumns('Name'),
                                AdminFunctions.customDataColumns('Email'),
                                AdminFunctions.customDataColumns(
                                    'Contact Number'),
                                AdminFunctions.customDataColumns('Faculty'),
                                AdminFunctions.customDataColumns('Actions'),
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
                                          _list[index].credential),
                                      DataCell(
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              CustomControlButton(
                                                  text: 'Update',
                                                  color: Colors.greenAccent,
                                                  basiccolor:
                                                      Colors.grey.shade50,
                                                  onPressed: () {
                                                    AdminForm
                                                        .adminregistrationform(
                                                            context, 'Update');
                                                  }),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              CustomControlButton(
                                                  text: 'Delete',
                                                  color:
                                                      Colors.redAccent.shade100,
                                                  basiccolor:
                                                      Colors.grey.shade50,
                                                  onPressed: () {
                                                    UtilMethod.customDialogBox(
                                                        context,
                                                        'Warning!',
                                                        'Do You Want to delete?');
                                                  }),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ));
                        },
                      ),
                    ));
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AdminForm.adminregistrationform(context, "Add Admin");
        },
        child: const Icon(Icons.group_add_sharp),
      ),
    );
  }
}
