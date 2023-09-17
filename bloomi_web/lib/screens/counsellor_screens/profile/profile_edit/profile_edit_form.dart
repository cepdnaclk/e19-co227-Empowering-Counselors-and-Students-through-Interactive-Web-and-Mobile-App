import 'package:bloomi_web/components/footer.dart';
import 'package:bloomi_web/responsive/responsive_layout.dart';
import 'package:bloomi_web/screens/counsellor_screens/profile/profile_edit/edit_desktop.dart';
import 'package:bloomi_web/screens/counsellor_screens/profile/profile_edit/edit_mobile.dart';
import 'package:bloomi_web/screens/counsellor_screens/profile/profile_edit/edit_tablet.dart';
import 'package:flutter/material.dart';

class CounselorEditForm extends StatefulWidget {
  const CounselorEditForm({super.key});

  @override
  State<CounselorEditForm> createState() => _CounselorEditFormState();
}

class _CounselorEditFormState extends State<CounselorEditForm> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: const ResponsiveLayout(
          mobileBody: editMobile(),
          tabletBody: editTablet(),
          desktopBody: editDesktop()),
      bottomNavigationBar: Footer(height: 55, width: width),
    );
  }
}
