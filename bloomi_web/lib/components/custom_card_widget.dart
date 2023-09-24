import 'package:bloomi_web/components/rich_text_widget.dart';
import 'package:bloomi_web/models/objects.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final List<AppointmentModel> list;
  final int index;
  const CustomCardWidget({
    super.key,
    required this.list,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        color: UtilConstants.lightgreyColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 100,
            vertical: 20,
          ),
          child: Column(
            children: [
              const Text(
                "Appointment Details",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(
                thickness: 1,
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          RichTextwidget(
                            list: list,
                            index: index,
                            text: "Student Name : ",
                            result: list[index].studentName,
                          ),
                          const SizedBox(height: 8),
                          RichTextwidget(
                            list: list,
                            index: index,
                            text: "Student Email : ",
                            result: list[index].studentEmail,
                          ),
                          const SizedBox(height: 8),
                          RichTextwidget(
                            list: list,
                            index: index,
                            text: "Student Faculty : ",
                            result: list[index].studentFaculty,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          RichTextwidget(
                            list: list,
                            index: index,
                            text: "Counselor Name : ",
                            result: list[index].counselorName,
                          ),
                          const SizedBox(height: 8),
                          RichTextwidget(
                            list: list,
                            index: index,
                            text: "Appointment Date : ",
                            result:
                                list[index].date.toString().substring(0, 10),
                          ),
                          const SizedBox(height: 8),
                          RichTextwidget(
                            list: list,
                            index: index,
                            text: "Appointment Time : ",
                            result: list[index].time,
                          ),
                        ],
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    height: 70,
                    width: 400,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: UtilConstants.lightgreyColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Status:"),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: UtilConstants.greenColor,
                          ),
                          child: const Center(
                            child: Text("Pending"),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
