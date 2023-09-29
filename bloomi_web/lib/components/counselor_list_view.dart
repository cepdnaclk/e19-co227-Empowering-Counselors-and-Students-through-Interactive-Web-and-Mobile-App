import 'package:bloomi_web/controllers/counsellor_controller.dart';
import 'package:bloomi_web/models/objects.dart';
import 'package:bloomi_web/utils/util_form_method.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class CounselorListView extends StatefulWidget {
  const CounselorListView({
    super.key,
  });
  @override
  State<CounselorListView> createState() => _CounselorListViewState();
}

class _CounselorListViewState extends State<CounselorListView> {
  final List<CounsellorModel> _listCounsellor = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<CounsellorModel> _filteredCounselors(String query) {
    return _listCounsellor.where((counselor) {
      final name = counselor.name.toLowerCase();
      return name.contains(query.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _searchController,
            onChanged: (query) {
              setState(() {});
            },
            decoration: InputDecoration(
              hintText: 'Search by name...',
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
              ),
              fillColor: Colors.white,
              filled: true,
            ),
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
        Expanded(
          child: StreamBuilder(
            stream: CounsellorController().getCounsellors(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text("Something went wrong"),
                );
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.data!.docs.isEmpty) {
                return const Center(
                  child: Text("No Counsellor found"),
                );
              }

              Logger().i(snapshot.data!.docs.length);

              _listCounsellor.clear();

              for (var e in snapshot.data!.docs) {
                Map<String, dynamic> data = e.data() as Map<String, dynamic>;
                var model = CounsellorModel.fromJson(data);
                _listCounsellor.add(model);
              }

              final counselorsToDisplay = _searchController.text.isNotEmpty
                  ? _filteredCounselors(_searchController.text)
                  : _listCounsellor;

              return ListView.builder(
                itemCount: counselorsToDisplay.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      tileColor: Colors.white,
                      title: Text(
                        counselorsToDisplay[index].name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                          shadows: [
                            Shadow(
                              blurRadius: 3.0,
                              color: Colors.grey,
                              offset: Offset(2.0, 2.0),
                            ),
                          ],
                        ),
                      ),
                      subtitle: Text(
                        counselorsToDisplay[index].userCredential,
                        style: const TextStyle(
                          fontSize: 16,
                          shadows: [
                            Shadow(
                              blurRadius: 2.0,
                              color: Colors.grey,
                              offset: Offset(1.0, 1.0),
                            ),
                          ],
                        ),
                      ),
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(counselorsToDisplay[index].imgUrl),
                        radius: 30,
                      ),
                      trailing: Tooltip(
                        message: "Add Appointment",
                        child: Ink(
                          decoration: const ShapeDecoration(
                            color: Colors.blueGrey,
                            shape: CircleBorder(),
                          ),
                          child: IconButton(
                            onPressed: () => UtilFormMethod.showDialogMethod(
                                context,
                                counselorsToDisplay[index].uid,
                                counselorsToDisplay[index].name),
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
