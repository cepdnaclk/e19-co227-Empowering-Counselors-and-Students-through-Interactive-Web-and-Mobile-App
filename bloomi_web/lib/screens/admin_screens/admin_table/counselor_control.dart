import 'package:bloomi_web/components/custom_tablecells.dart';
import 'package:bloomi_web/components/custom_tableheads.dart';
import 'package:bloomi_web/screens/admin_screens/registration%20_forms/counselorform.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:bloomi_web/utils/util_function.dart';
import 'package:flutter/material.dart';

class Counselorcontrol extends StatefulWidget {
  const Counselorcontrol({super.key});

  @override
  State<Counselorcontrol> createState() => _CounselorcontrolState();
}

class _CounselorcontrolState extends State<Counselorcontrol> {
  final counselornames = [
    "Sarah Smith",
    "John Davis",
    "Emily Johnson",
    "Michael Brown",
    "Laura Wilson",
    "David White",
    "Jessica Anderson",
    "Mark Taylor",
    "Jennifer Garcia",
    "Robert Lee",
  ];

  final counselorid = [
    "547826",
    "309215",
    "682734",
    "125439",
    "876521",
    "432198",
    "759346",
    "246810",
    "987654",
    "314159",
  ];
  final counseloremails = [
    "john.doe@email.com",
    "susan.smith@email.com",
    "michael.johnson@email.com",
    "lisa.wilson@email.com",
    "david.brown@email.com",
    "emily.miller@email.com",
    "robert.jones@email.com",
    "sarah.davis@email.com",
    "jennifer.wang@email.com",
    "william.chen@email.com"
  ];
  final counselorphonenumber = [
    "555-123-4567",
    "555-987-6543",
    "555-567-8901",
    "555-234-5678",
    "555-789-0123",
    "555-345-6789",
    "555-901-2345",
    "555-678-9012",
    "555-432-1098",
    "555-210-9876"
  ];
  final faculties = [
    'Faculty of Engineering',
    'Faculty of Medicine',
    'Faculty of Dental Sciences',
    'Faculty of Veterinary Medicine and Animal Science',
    'Faculty of Science',
    'Faculty of Agriculture',
    'Faculty of Allied Health Sciences',
    'Faculty of Arts',
    'Faculty of Management',
    'Faculty of Engineering',
  ];
  final credentials = [
    "PhD, Certified Life Coach",
    "MSW, Licensed Counselor",
    "MBA, Certified Financial Planner",
    "RN, BLS Certified",
    "CPA, CFA",
    "JD, Notary Public",
    "PMP, Certified Project Manager",
    "EMT, ACLS Certified",
    "MA, Licensed Psychologist",
    "CEH, Certified Ethical Hacker"
  ];

  final passwords = [
    "BlueSky123",
    "StarGazer87",
    "TechNinja55",
    "GardenLover22",
    "MusicMaestro99",
    "AdventureSeeker42",
    "FoodieChic76",
    "Bookworm17",
    "FitnessFanatic88",
    "TravelBuddy61"
  ];

  List<bool> isRowHovered = List.generate(10, (index) => false);
  List<bool> isRowHoveredDeleted = List.generate(10, (index) => false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: ElevatedButton(
                onPressed: () {
                  UtilFunction.navigateForward(
                    context,
                    const Counselorform(),
                  );
                },
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  padding: const EdgeInsets.all(20),
                ),
                child: const Text(
                  'Add Counselor',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Table(
                columnWidths: const <int, TableColumnWidth>{
                  0: FlexColumnWidth(0.8),
                  1: FlexColumnWidth(0.9),
                  2: FlexColumnWidth(1.1),
                  3: FlexColumnWidth(0.8),
                  4: FlexColumnWidth(1.2),
                  5: FlexColumnWidth(1.2),
                  6: FlexColumnWidth(1.2),
                },
                border: TableBorder.all(
                  width: 1.5,
                  color: UtilConstants.primaryColor,
                ),
                children: [
                  const TableRow(children: [
                    Tableheads(text: 'Counselor Id'),
                    Tableheads(text: 'Name'),
                    Tableheads(text: 'Email'),
                    Tableheads(text: 'Contact Nu.'),
                    Tableheads(text: 'Faculty'),
                    Tableheads(text: 'Credentials'),
                    Tableheads(text: 'Controls'),
                  ]),
                  for (int index = 0; index < counselornames.length; index++)
                    TableRow(children: [
                      Tablecellwidget(name: counselorid, indexnumber: index),
                      Tablecellwidget(name: counselornames, indexnumber: index),
                      Tablecellwidget(
                          name: counseloremails, indexnumber: index),
                      Tablecellwidget(
                          name: counselorphonenumber, indexnumber: index),
                      Tablecellwidget(name: faculties, indexnumber: index),
                      Tablecellwidget(name: credentials, indexnumber: index),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              MouseRegion(
                                onEnter: (_) {
                                  setState(() {
                                    isRowHovered[index] = true;
                                  });
                                },
                                onExit: (_) {
                                  setState(() {
                                    isRowHovered[index] = false;
                                  });
                                },
                                child: ElevatedButton(
                                    onPressed: () {
                                      UtilFunction.navigateForward(
                                        context,
                                        const Counselorform(),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: isRowHovered[index]
                                          ? Colors.greenAccent
                                          : Colors.grey.shade50,
                                    ),
                                    child: Text(
                                      'Update',
                                      style: TextStyle(
                                        color: isRowHovered[index]
                                            ? Colors.black
                                            : Colors.purple.shade400,
                                      ),
                                    )),
                              ),
                              MouseRegion(
                                onEnter: (_) {
                                  setState(() {
                                    isRowHoveredDeleted[index] = true;
                                  });
                                },
                                onExit: (_) {
                                  setState(() {
                                    isRowHoveredDeleted[index] = false;
                                  });
                                },
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: isRowHoveredDeleted[index]
                                        ? Colors.redAccent.shade200
                                        : Colors.grey.shade50,
                                  ),
                                  child: Text(
                                    'Delete',
                                    style: TextStyle(
                                      color: isRowHoveredDeleted[index]
                                          ? Colors.black
                                          : Colors.purple.shade400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
