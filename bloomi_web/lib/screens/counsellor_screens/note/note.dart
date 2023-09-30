import 'package:bloomi_web/components/calender.dart';
import 'package:bloomi_web/components/custom_form_note_taking.dart';
import 'package:bloomi_web/screens/counsellor_screens/note/note_card.dart';
import 'package:flutter/material.dart';

class CalendarApp extends StatelessWidget {
  const CalendarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Calendar Demo', home: NoteCounsellor());
  }
}

class NoteCounsellor extends StatefulWidget {
  const NoteCounsellor({Key? key}) : super(key: key);

  @override
  State<NoteCounsellor> createState() => _NoteCounsellorState();
}

class _NoteCounsellorState extends State<NoteCounsellor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            // For mobile devices
            return Column(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  padding: const EdgeInsets.all(10),
                  width: double.infinity, // Expand to full width
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black),
                  ),
                  child: const Calender(),
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: NoteCardCounsellor(),
                  ),
                ),
              ],
            );
          } else if (constraints.maxWidth < 1000) {
            // For tablets
            return Column(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black),
                  ),
                  child: const Calender(),
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10, left: 40, right: 40),
                    child: NoteCardCounsellor(),
                  ),
                ),
              ],
            );
          } else {
            // For laptops and larger screens
            return Row(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  padding: const EdgeInsets.all(10),
                  width: 600, // Fixed width for laptops
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black),
                  ),
                  child: const Calender(),
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: NoteCardCounsellor(),
                  ),
                ),
              ],
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          UtilFormMethodNoteTaking.showDialogMethod(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
