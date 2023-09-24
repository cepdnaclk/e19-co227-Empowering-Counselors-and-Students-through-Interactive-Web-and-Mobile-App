import 'package:bloomi_web/components/custom_control_buttons.dart';
import 'package:bloomi_web/providers/admin/counselor_registration_provider.dart';
import 'package:bloomi_web/screens/admin_screens/registration%20_forms/counselorform.dart';
import 'package:bloomi_web/utils/util_admin_functions.dart';
import 'package:bloomi_web/utils/util_method.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counselorcontrol extends StatefulWidget {
  const Counselorcontrol({super.key});

  @override
  State<Counselorcontrol> createState() => _CounselorcontrolState();
}

class _CounselorcontrolState extends State<Counselorcontrol> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<CounsellorRegistrationProvider>(
              builder: (context, value, child) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
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
                          AdminFunctions.customDataColumns('Credentials'),
                          AdminFunctions.customDataColumns('Actions'),
                        ],
                        rows: List.generate(
                          value.allCounsellorModel.length,
                          (index) {
                            return DataRow(
                              cells: [
                                AdminFunctions.customDatacells(
                                    value.allCounsellorModel[index].name),
                                AdminFunctions.customDatacells(
                                    value.allCounsellorModel[index].email),
                                AdminFunctions.customDatacells(
                                    value.allCounsellorModel[index].phone),
                                AdminFunctions.customDatacells(
                                    value.allCounsellorModel[index].faculty),
                                AdminFunctions.customDatacells(value
                                    .allCounsellorModel[index].userCredential),
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
                                                'Do You want to delete?');
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        )),
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
