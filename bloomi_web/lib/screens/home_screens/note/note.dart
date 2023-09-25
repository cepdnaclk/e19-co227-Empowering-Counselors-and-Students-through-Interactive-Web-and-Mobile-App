import 'package:bloomi_web/components/calender.dart';
import 'package:bloomi_web/components/custom_form_note_taking.dart';
import 'package:bloomi_web/components/note_card.dart';
import 'package:bloomi_web/providers/user_home_provider/note_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const CalendarApp());
}

class CalendarApp extends StatelessWidget {
  const CalendarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Calendar Demo', home: Note());
  }
}

class Note extends StatefulWidget {
  const Note({Key? key}) : super(key: key);

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            padding: const EdgeInsets.all(10),
            width: 600,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black),
            ),
            child: const Calender(),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: NoteCard(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Consumer<NoteProvider>(
                builder: (context, value, child) {
                  return const CustomFormNoteTaking();
                },
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
