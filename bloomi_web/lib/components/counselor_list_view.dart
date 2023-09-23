import 'package:bloomi_web/providers/user_home_provider/user_appoinment_provider.dart';
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
    return Consumer<UserAppoinmentProvider>(
      builder: (context, value, child) {
        return ListView.builder(
          itemCount:
              value.allCounselorModel.length, // Use the length of the list
          itemBuilder: (context, index) {
            return Card(
              color: UtilConstants.lightgreyColor,
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                title: Text(value.allCounselorModel[index].name),
                subtitle: Text(value.allCounselorModel[index].userCredential),
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage(value.allCounselorModel[index].imgUrl),
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
                      onPressed: () => UtilFormMethod.showDialogMethod(context),
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
