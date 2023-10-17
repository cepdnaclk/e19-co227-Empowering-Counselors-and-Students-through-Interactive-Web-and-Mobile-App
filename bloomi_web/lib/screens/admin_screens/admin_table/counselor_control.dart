import 'package:bloomi_web/components/custom_control_buttons.dart';
import 'package:bloomi_web/controllers/counsellor_controller.dart';
import 'package:bloomi_web/models/objects.dart';
import 'package:bloomi_web/providers/admin/counselor_registration_provider.dart';
import 'package:bloomi_web/screens/admin_screens/registration%20_forms/counselorform.dart';
import 'package:bloomi_web/utils/util_admin_functions.dart';
import 'package:bloomi_web/utils/util_method.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class Counselorcontrol extends StatefulWidget {
  const Counselorcontrol({super.key});

  @override
  State<Counselorcontrol> createState() => _CounselorcontrolState();
}

class _CounselorcontrolState extends State<Counselorcontrol> {
  final List<CounsellorModel> _list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<CounsellorRegistrationProvider>(
              builder: (context, value, child) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: StreamBuilder(
                      stream: CounsellorController().getCounsellors(),
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
                            child: Text("No Counselors found"),
                          );
                        }

                        Logger().i(snapshot.data!.docs.length);

                        //-------------clear the list before adding new data----------------
                        _list.clear();

                        //-----------------read the document list from snapshot and map to model and add to list----------------
                        for (var e in snapshot.data!.docs) {
                          Map<String, dynamic> data =
                              e.data() as Map<String, dynamic>;
                          var model = CounsellorModel.fromJson(data);
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
                              AdminFunctions.customDataColumns('Credentials'),
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
                                        _list[index].faculty),
                                    AdminFunctions.customDatacells(
                                        _list[index].userCredential),
                                    DataCell(
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            CustomControlButton(
                                              text: 'Update',
                                              color: Colors.greenAccent,
                                              basiccolor: Colors.grey.shade50,
                                              onPressed: () {
                                                CounselorForm
                                                    .counselorregistrationform(
                                                        context);
                                              },
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            CustomControlButton(
                                              text: 'Delete',
                                              color: Colors.redAccent.shade100,
                                              basiccolor: Colors.grey.shade50,
                                              onPressed: () {
                                                UtilMethod.customDialogBox(
                                                    context,
                                                    'Warning!',
                                                    'Do You want to delete?',
                                                    onCancelPressed: () {},
                                                    onOkPressed: () {});
                                              },
                                            ),
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
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          CounselorForm.counselorregistrationform(context);
        },
        child: const Icon(Icons.group_add_sharp),
      ),
    );
  }
}
