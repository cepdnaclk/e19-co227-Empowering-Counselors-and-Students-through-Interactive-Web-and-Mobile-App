import 'package:bloomi_web/providers/admin/counselor_registration_provider.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:bloomi_web/utils/util_form_method.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounselorListView extends StatelessWidget {
  const CounselorListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CounsellorRegistrationProvider>(
      builder: (context, value, child) {
        return ListView.builder(
          itemCount:
              value.allCounsellorModel.length, // Use the length of the list
          itemBuilder: (context, index) {
            return Card(
              color: UtilConstants.lightgreyColor,
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                title: Text(value.allCounsellorModel[index].name),
                subtitle: Text(value.allCounsellorModel[index].userCredential),
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage(value.allCounsellorModel[index].imgUrl),
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
                          value.allCounsellorModel[index].uid,
                          value.allCounsellorModel[index].name),
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
