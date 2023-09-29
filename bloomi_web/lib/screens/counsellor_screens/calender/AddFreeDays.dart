import 'package:bloomi_web/components/form_button_web.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class AddFreeDays extends StatefulWidget {
  const AddFreeDays({super.key});

  @override
  State<AddFreeDays> createState() => _AddFreeDaysState();
}

class _AddFreeDaysState extends State<AddFreeDays> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return AlertDialog(
      contentPadding: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      scrollable: true,
      content: SingleChildScrollView(
          child: Container(
        height: 400,
        width: width < 480 ? width * 0.75 : 350,
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 20),
        decoration: BoxDecoration(
          color: UtilConstants.lightgreyColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(children: [
          const Text(
            "Update Free Days",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: UtilConstants.primaryColor,
                fontSize: 20),
          ),
          const SizedBox(height: 30),
          const Text(
            "Enter number of days",
          ),
          SizedBox(
            height: height * 0.05,
          ),
          InkWell(
            onTap: () {
              //add free days to firebase
              Navigator.of(context).pop();
            },
            child: const FormButtonWeb(
              'Save',
              width: 100,
              height: 30,
              fontSize: 12,
              isLoading: false,
            ),
          ),
          /*Consumer<CounsellorRegistrationProvider>(
                builder: (context, value, child) {
                  return InkWell(
                    onTap: () {
                      //upload image
                    },
                    child: FormButtonWeb(
                      'Save',
                      width: 100,
                      height: 30,
                      fontSize: 12,
                      isLoading: value.isLoading,
                    ),
                  );
                },
              ),*/
        ]),
      )),
    );
  }
}
