import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/providers/admin/counselor_registration_provider.dart';
import 'package:bloomi_web/providers/user_home_provider/note_provider.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UtilFormMethodNoteTakingCounsellor {
  //---------------------------method to show dialog box input feild---------------------------
  static showDialogMethod(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            width: 400, // Set your desired width here
            height: 410, // Set your desired height here
            child: Column(
              children: [
                const SizedBox(height: 25),
                const CustomText(
                  "Add Note",
                  fontColor: UtilConstants.blackColor,
                  fontSize: 30,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller:
                      Provider.of<NoteProvider>(context).getTitleController,
                  decoration: const InputDecoration(
                    hintText: 'Enter Title Here',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: Provider.of<NoteProvider>(context)
                      .getDescriptionController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    hintText: 'Enter Description Here',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                Consumer2<NoteProvider, CounsellorRegistrationProvider>(
                  builder: (context, value, value3, child) {
                    return ElevatedButton(
                      onPressed: () async {
                        await value.saveNote(
                            value.getTitleController.text,
                            value.getDescriptionController.text,
                            context,
                            value3.counsellorModel!.uid);
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
