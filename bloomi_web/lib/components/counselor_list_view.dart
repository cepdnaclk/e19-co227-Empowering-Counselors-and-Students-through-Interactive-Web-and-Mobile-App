import 'package:bloomi_web/controllers/counsellor_controller.dart';
import 'package:bloomi_web/models/objects.dart';
import 'package:bloomi_web/utils/util_form_method.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class CounselorListView extends StatefulWidget {
  const CounselorListView({super.key});

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
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 75, 75, 112),
        title: const Text('Available Counsellors',
            style: TextStyle(
              color: Colors.white,
            )),
      ),
      backgroundColor: const Color.fromARGB(255, 228, 218, 230),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
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
                  borderRadius: BorderRadius.circular(20),
                ),
                fillColor: Colors.white,
                filled: true,
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600], // Hint text color
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              ),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
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
                    Map<String, dynamic> data =
                        e.data() as Map<String, dynamic>;
                    var model = CounsellorModel.fromJson(data);
                    _listCounsellor.add(model);
                  }

                  final screenWidth = MediaQuery.of(context).size.width;
                  int columns = 1;

                  if (screenWidth > 700) {
                    columns = 2;
                  }
                  if (screenWidth > 1200) {
                    columns = 3;
                  }

                  final counselorsToDisplay = _searchController.text.isNotEmpty
                      ? _filteredCounselors(_searchController.text)
                      : _listCounsellor;

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columns,
                      childAspectRatio: screenWidth > 900 ? 2.0 : 6.5,
                      mainAxisSpacing: 14.0,
                      crossAxisSpacing: 8.0,
                      mainAxisExtent: 90.0,
                    ),
                    itemCount: counselorsToDisplay.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Colors.white,
                        child: Center(
                          child: ListTile(
                            title: Text(
                              counselorsToDisplay[index].name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black,
                                shadows: [
                                  Shadow(
                                    blurRadius: 3.0,
                                    color: Colors.grey.shade300,
                                    offset: const Offset(2.0, 2.0),
                                  ),
                                ],
                              ),
                            ),
                            subtitle: Text(
                              counselorsToDisplay[index].userCredential,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600], // Subtitle text color
                                shadows: [
                                  Shadow(
                                    blurRadius: 2.0,
                                    color: Colors.grey.shade300, // Shadow color
                                    offset: const Offset(1.0, 1.0),
                                  ),
                                ],
                              ),
                            ),
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  counselorsToDisplay[index].imgUrl),
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
                                  onPressed: () =>
                                      UtilFormMethod.showDialogMethod(
                                    context,
                                    counselorsToDisplay[index].uid,
                                    counselorsToDisplay[index].name,
                                    counselorsToDisplay[index].email,
                                  ),
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.white, // Icon color
                                  ),
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
          ),
        ],
      ),
    );
  }
}
