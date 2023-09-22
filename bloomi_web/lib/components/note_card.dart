import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/controllers/note_controller.dart';
import 'package:bloomi_web/models/objects.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class NoteCard extends StatefulWidget {
  const NoteCard({
    super.key,
  });

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  final List<NoteModel> _list = [];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: NoteController().getNotes(),
      builder: (context, snapshot) {
        //-------if the snapshot error occurs, show error message-------
        if (snapshot.hasError) {
          return const Center(
            child: Text("Something went wrong"),
          );
        }

        //-------if the snapshot is waiting, show progress indicator-------
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text("No Notes found"),
          );
        }

        Logger().i(snapshot.data!.docs.length);

        //-------------clear the list before adding new data----------------
        _list.clear();

        //-----------------read the document list from snapshot and map to model and add to list----------------
        for (var e in snapshot.data!.docs) {
          Map<String, dynamic> data = e.data() as Map<String, dynamic>;
          var model = NoteModel.fromJson(data);
          _list.add(model);
        }

        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: UtilConstants.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: UtilConstants.greyColor,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: ListTile(
                tileColor: UtilConstants.greyColor,
                title: CustomText(
                  _list[index].title,
                  fontColor: UtilConstants.blackColor,
                  textAlign: TextAlign.left,
                  fontSize: 20,
                ),
                subtitle: CustomText(
                  _list[index].description,
                  fontColor: UtilConstants.blackColor,
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.delete)),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
                  ],
                ),
              ),
            );
          },
          itemCount: _list.length,
        );
      },
    );
  }
}
