import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/controllers/admin_controller.dart';
import 'package:bloomi_web/models/objects.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AdminActivityLog extends StatefulWidget {
  const AdminActivityLog({super.key});

  @override
  State<AdminActivityLog> createState() => _AdminActivityLogState();
}

class _AdminActivityLogState extends State<AdminActivityLog> {
  final List<ActivityLog> _list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue.shade50,
      body: StreamBuilder(
        stream: AdminController().getAllActivityLog(),
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
              child: Text("No Activity found"),
            );
          }

          Logger().i(snapshot.data!.docs.length);

          //-------------clear the list before adding new data----------------
          _list.clear();

          //-----------------read the document list from snapshot and map to model and add to list----------------
          for (var e in snapshot.data!.docs) {
            Map<String, dynamic> data = e.data() as Map<String, dynamic>;
            var model = ActivityLog.fromJson(data);
            _list.add(model);
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            shrinkWrap: true,
            itemCount: _list.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  "Administrator ${_list[index].adminName}  ${_list[index].change} a new user account for ${_list[index].userName}.",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                leading: const Icon(
                  Icons.add_task,
                  color: Color.fromARGB(255, 25, 27, 175),
                ),
                trailing: CustomText(
                  _list[index].dateTime.toString().substring(0, 16),
                  fontSize: 15,
                  fontColor: const Color.fromARGB(255, 48, 72, 150),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
