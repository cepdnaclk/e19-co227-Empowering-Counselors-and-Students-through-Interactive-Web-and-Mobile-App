import 'package:flutter/material.dart';

class CounselorProfile extends StatefulWidget {
  const CounselorProfile({super.key});

  @override
  State<CounselorProfile> createState() => _CounselorProfileState();
}

class _CounselorProfileState extends State<CounselorProfile> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        body: Center(
            child: Container(
      child: Card(
          elevation: 0,
          color: Color.fromARGB(255, 135, 186, 235),
          child: Container(
            width: mediaQueryData.size.width * 0.8,
            height: mediaQueryData.size.width * 0.8,
          )),
    )));
  }
}
