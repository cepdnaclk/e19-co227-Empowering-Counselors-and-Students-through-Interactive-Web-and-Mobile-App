import 'package:bloomi_web/screens/Admin/Registration%20_forms/Counselorform.dart';
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

  final counselornumber = [
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
  final usernames = [
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

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          Counselorform(mediaQueryData: mediaQueryData),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  elevation: 20,
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
                    0: FlexColumnWidth(1.0),
                    1: FlexColumnWidth(1.0),
                    2: FlexColumnWidth(1.0),
                    3: FlexColumnWidth(1.0),
                    4: FlexColumnWidth(1.0),
                    5: FlexColumnWidth(1.0),
                    6: FlexColumnWidth(1.0),
                    7: FlexColumnWidth(1.0),
                  },
                  border: TableBorder.all(
                    color: Colors.blue.shade500,
                  ),
                  children: [
                    const TableRow(children: [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TableCell(
                            child: Text(
                          'Counselor Name',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TableCell(
                            child: Text(
                          'Counselor Email',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TableCell(
                            child: Text(
                          'Counselor ID',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TableCell(
                            child: Text(
                          'Counselor Phone Number',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TableCell(
                            child: Text(
                          'Faculty',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TableCell(
                            child: Text(
                          'Credentials',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TableCell(
                            child: Text(
                          'User Name',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TableCell(
                            child: Text(
                          'Password',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        )),
                      ),
                    ]),
                    for (int index = 0; index < counselornames.length; index++)
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TableCell(
                              child: Text(
                            counselornames[index],
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TableCell(child: Text(counselornumber[index])),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TableCell(child: Text(counseloremails[index])),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TableCell(
                              child: Text(counselorphonenumber[index])),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TableCell(child: Text(faculties[index])),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TableCell(child: Text(credentials[index])),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TableCell(child: Text(usernames[index])),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TableCell(child: Text(passwords[index])),
                        ),
                      ]),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
