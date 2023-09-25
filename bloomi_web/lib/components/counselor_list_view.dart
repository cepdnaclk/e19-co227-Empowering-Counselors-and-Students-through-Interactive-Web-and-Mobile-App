import 'package:bloomi_web/controllers/counsellor_controller.dart';
import 'package:bloomi_web/models/objects.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:bloomi_web/utils/util_form_method.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class CounselorListView extends StatefulWidget {
  const CounselorListView({
    super.key,
  });
  @override
  State<CounselorListView> createState() => _CounselorListViewState();
}

class _CounselorListViewState extends State<CounselorListView> {
  final List<CounsellorModel> _listCounsellor = [];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: CounsellorController().getCounsellors(),
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
            child: Text("No Counsellor found"),
          );
        }

        Logger().i(snapshot.data!.docs.length);

        //-------------clear the list before adding new data----------------
        _listCounsellor.clear();

        //-----------------read the document list from snapshot and map to model and add to list----------------
        for (var e in snapshot.data!.docs) {
          Map<String, dynamic> data = e.data() as Map<String, dynamic>;
          var model = CounsellorModel.fromJson(data);
          _listCounsellor.add(model);
        }

        return ListView.builder(
          itemCount: _listCounsellor.length, // Use the length of the list
          itemBuilder: (context, index) {
            return Card(
              color: UtilConstants.lightgreyColor,
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                title: Text(_listCounsellor[index].name),
                subtitle: Text(_listCounsellor[index].userCredential),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(_listCounsellor[index].imgUrl),
                ),
                trailing: Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: () => UtilFormMethod.showDialogMethod(
                          context,
                          _listCounsellor[index].uid,
                          _listCounsellor[index].name),
                      child: const Icon(Icons.add, color: Colors.white),
                    )),
              ),
            );
          },
        );
      },
    );
  }
}
