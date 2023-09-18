import 'package:bloomi_web/components/custom_date_picker.dart';
import 'package:bloomi_web/components/custom_time_picker.dart';
import 'package:bloomi_web/components/form_button_web.dart';
import 'package:bloomi_web/components/form_input_web.dart';
import 'package:bloomi_web/providers/user_home_provider/user_appoinment_provider.dart';
import 'package:bloomi_web/providers/users/user_provider.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xen_popup_card/xen_card.dart';

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
                      onPressed: () => showDialog(
                        context: context,
                        builder: (builder) => XenPopupCard(
                          appBar: const XenCardAppBar(
                            color: UtilConstants.primaryColor,
                            shadow: BoxShadow(color: Colors.transparent),
                            child: Text(
                              "Appointment",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 28),
                            ), // To remove shadow from appbar
                          ),
                          body: Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 950,
                              height: 450,
                              decoration: BoxDecoration(
                                color: UtilConstants.greyColor.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Consumer<UserProvider>(
                                    builder: (context, value, child) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            children: [
                                              FormInputWeb(
                                                "Full Name",
                                                textEditingController:
                                                    TextEditingController(
                                                        text: value
                                                            .userModel!.name),
                                              ),
                                              const SizedBox(height: 10),
                                              FormInputWeb(
                                                "User ID",
                                                textEditingController:
                                                    TextEditingController(
                                                        text: value
                                                            .userModel!.uid),
                                              ),
                                              const SizedBox(height: 10),
                                              FormInputWeb(
                                                "Faculty",
                                                textEditingController:
                                                    TextEditingController(
                                                        text: value.userModel!
                                                            .faculty),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(width: 20),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              FormInputWeb(
                                                "Email",
                                                textEditingController:
                                                    TextEditingController(
                                                        text: value
                                                            .userModel!.email),
                                              ),
                                              const SizedBox(height: 10),
                                              const CustomDatePicker(),
                                              const SizedBox(height: 10),
                                              const CustomTimePicker(),
                                            ],
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 50),
                                  const FormButtonWeb(
                                    "Send Appointment",
                                    width: 865,
                                    isLoading: false,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
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
