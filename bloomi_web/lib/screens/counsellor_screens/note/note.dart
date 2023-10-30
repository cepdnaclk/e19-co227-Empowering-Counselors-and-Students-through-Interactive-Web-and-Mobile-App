import 'package:bloomi_web/components/calender.dart';
import 'package:bloomi_web/components/footer.dart';
import 'package:bloomi_web/screens/counsellor_screens/note/custom_form_note_taking_counsellor.dart';
import 'package:bloomi_web/screens/counsellor_screens/note/note_card.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class CalendarApp extends StatelessWidget {
  const CalendarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Calendar Demo', home: NoteCounsellor());
  }
}

class NoteCounsellor extends StatefulWidget {
  const NoteCounsellor({super.key});

  @override
  State<NoteCounsellor> createState() => _NoteCounsellorState();
}

class _NoteCounsellorState extends State<NoteCounsellor> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            // For mobile devices
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    padding: const EdgeInsets.all(10),
                    width: width,
                    height: height * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black),
                    ),
                    child: const Calendar(),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 25, left: 10, right: 10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      color: UtilConstants.lightgreyColor,
                      width: width,
                      height: height * 0.8,
                      child: const NoteCardCounsellor(),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Footer(height: 55, width: width)
                ],
              ),
            );
          } else if (constraints.maxWidth < 1000) {
            // For tablets
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: width,
                    height: height * 0.8,
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 60),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black),
                    ),
                    child: const Calendar(),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 25, left: 60, right: 60),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      color: UtilConstants.lightgreyColor,
                      width: width,
                      height: height * 0.8,
                      child: const NoteCardCounsellor(),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Footer(height: 55, width: width)
                ],
              ),
            );
          } else {
            // For laptops and larger screens
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          padding: const EdgeInsets.all(10),
                          width: width * 0.3,
                          height: height * 0.75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black),
                          ),
                          child: const Calendar(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          color: UtilConstants.lightgreyColor,
                          width: width * 0.5,
                          height: height * 0.75,
                          child: const NoteCardCounsellor(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.11),
                  Footer(height: 55, width: width)
                ],
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          UtilFormMethodNoteTakingCounsellor.showDialogMethod(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
