import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/components/custom_textfeild.dart';
import 'package:bloomi_web/screens/home/Appointment/dashboard.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  String? selectedCounsellor;
  DateTime? selectedDate;
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: mediaQueryData.size.height * 0.03),
            child: Column(
              children: [
                SizedBox(height: mediaQueryData.size.height * 0.05),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Dashboard()),
                      );
                    },
                    child: const Icon(Icons.arrow_back_ios_new_outlined),
                  ),
                ),
                SizedBox(height: mediaQueryData.size.height * 0.05),
                CustomText(
                  "New Appointment",
                  fontSize: mediaQueryData.size.height * 0.04,
                  fontWeight: FontWeight.w600,
                ),
                Image.asset(
                  UtilConstants.counsellingImagePath,
                  width: mediaQueryData.size.height * 0.38,
                  height: mediaQueryData.size.height * 0.19,
                ),
                SizedBox(height: mediaQueryData.size.height * 0.08),
                CustomTextFeild(
                  textEditingController: _name,
                  lable: "Full Name",
                  mediaQueryData: mediaQueryData,
                  keyboardType: TextInputType.text,
                  width: mediaQueryData.size.width * 0.4,
                ),
                SizedBox(height: mediaQueryData.size.height * 0.02),
                CustomTextFeild(
                  textEditingController: _email,
                  lable: "Email",
                  mediaQueryData: mediaQueryData,
                  keyboardType: TextInputType.emailAddress,
                  width: mediaQueryData.size.width * 0.4,
                ),
                SizedBox(width: 580, height: mediaQueryData.size.height * 0.02),
                SizedBox(
                  width: 580,
                  height: mediaQueryData.size.height * 0.08,
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Select Counsellor',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )),
                    ),
                    value: selectedCounsellor,
                    onChanged: (newValue) {
                      setState(() {
                        selectedCounsellor = newValue;
                      });
                    },
                    items: const [
                      DropdownMenuItem(
                        value: 'Counsellor 1',
                        child: Text('Counsellor 1'),
                      ),
                      DropdownMenuItem(
                        value: 'Counsellor 2',
                        child: Text('Counsellor 2'),
                      ),
                      // Add more DropdownMenuItem widgets for additional options
                    ],
                  ),
                ),
                SizedBox(height: mediaQueryData.size.height * 0.02),
                SizedBox(
                  width: 580,
                  height: mediaQueryData.size.height * 0.075,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Select a Date',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )),
                    ),
                    onTap: () async {
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          selectedDate = pickedDate;
                        });
                      }
                    },
                    controller: TextEditingController(
                      text: selectedDate != null
                          ? "DateFormat('yyyy-MM-dd').format(selectedDate!)"
                          : '',
                    ),
                    readOnly: true,
                  ),
                ),
                SizedBox(height: mediaQueryData.size.height * 0.02),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      // Save data to database
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Dashboard(),
                      ));
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: mediaQueryData.size.height * 0.08,
                      vertical: mediaQueryData.size.height * 0.02,
                    ),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue, // Set text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          mediaQueryData.size.height * 0.03),
                    ),
                  ),
                  child: CustomText(
                    "Save",
                    fontColor: UtilConstants.whiteColor,
                    fontSize: mediaQueryData.size.height * 0.025,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: mediaQueryData.size.height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
