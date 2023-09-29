import 'package:bloomi_web/components/calender.dart';
import 'package:bloomi_web/components/dropdown_button.dart';
import 'package:bloomi_web/controllers/counsellor_controller.dart';
import 'package:bloomi_web/models/objects.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class CalenderUser extends StatelessWidget {
  const CalenderUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<CounsellorModel> listCounsellor = [];
    final List<String> listCounsellorName = [];
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black),
        ),
        child: Column(
          children: [
            StreamBuilder(
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
                listCounsellor.clear();

                //-----------------read the document list from snapshot and map to model and add to list----------------
                for (var e in snapshot.data!.docs) {
                  Map<String, dynamic> data = e.data() as Map<String, dynamic>;
                  var model = CounsellorModel.fromJson(data);
                  listCounsellor.add(model);
                  listCounsellorName.add(model.name);
                }

                return DropDownButtonWidget(
                  listItem: listCounsellorName,
                  text: "Select Counselor",
                  index: 1,
                );
              },
            ),
            const Calender(),
          ],
        ),
      ),
    );
  }
}
