import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/providers/user_home_provider/note_provider.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomFormNoteTaking extends StatelessWidget {
  const CustomFormNoteTaking({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 60, right: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomText(
            "Add Note",
            fontColor: UtilConstants.blackColor,
          ),
          const SizedBox(height: 20),
          TextField(
              controller: Provider.of<NoteProvider>(context).getTitleController,
              decoration: const InputDecoration(
                hintText: 'Enter Title Here',
                border: OutlineInputBorder(),
              )),
          const SizedBox(height: 10),
          TextField(
              controller:
                  Provider.of<NoteProvider>(context).getDescriptionController,
              decoration: const InputDecoration(
                hintText: 'Enter Discription Here',
                border: OutlineInputBorder(),
              )),
          const SizedBox(height: 30),
          Consumer<NoteProvider>(
            builder: (context, value, child) {
              return ElevatedButton(
                onPressed: () async {
                  await value.saveNote(
                    value.getTitleController.text,
                    value.getDescriptionController.text,
                    context,
                  );
                  // Clear text fields after saving
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                    (states) {
                      if (states.contains(MaterialState.hovered)) {
                        return UtilConstants.greenColor;
                      }
                      return UtilConstants.greenColor;
                    },
                  ),
                  minimumSize: MaterialStateProperty.all(
                      const Size(double.infinity, 60)),
                ),
                child: value.isLoading
                    ? const CircularProgressIndicator.adaptive()
                    : const CustomText(
                        "Save Note",
                        fontColor: UtilConstants.blackColor,
                        fontSize: 15,
                      ),
              );
            },
          )
        ],
      ),
    );
  }
}
