import 'package:bloomi_web/providers/user_home_provider/user_appoinment_provider.dart';
import 'package:bloomi_web/utils/util_constant.dart';
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
              color: UtilConstants.tropicalBlurColor,
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
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    onTap: () {
                      showBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 200,
                            color: Colors.amber,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const Text('BottomSheet'),
                                  ElevatedButton(
                                    child: const Text('Close BottomSheet'),
                                    onPressed: () => Navigator.pop(context),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: const Icon(Icons.add),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
