import 'package:bloomi_web/components/custom_text.dart';
import 'package:flutter/material.dart';

class AdminActivityLog extends StatefulWidget {
  const AdminActivityLog({super.key});

  @override
  State<AdminActivityLog> createState() => _AdminActivityLogState();
}

class _AdminActivityLogState extends State<AdminActivityLog> {
  final histories = [
    "Administrator John Smith created a new user account for User123.",
    "Administrator Jane Doe deleted User456's account.",
    "Admin Susan Johnson initiated a password reset for User789.",
    "Admin Mark Anderson updated User101's role to 'Manager'.",
    "Admin Sarah Williams edited document 'ProjectReport.doc'.",
    "Administrator Michael Brown approved 'Blog Post #3' for publication.",
    "Admin Mary Davis modified the email notification settings.",
    "Admin Chris White applied system updates and patches on 2023-09-13.",
    "Admin Login: Failed login attempt by UserX on 2023-09-10.",
    "Admin George Martin granted 'Read-Only' access to UserY for the Sales Reports folder.",
    "Admin Emily Green encountered an error while processing a customer's payment on 2023-09-05.",
    "Administrator Robert Turner temporarily suspended UserZ due to a violation of company policies.",
    "Admin Rachel Harris updated customer records: Added new contact details for CustomerA.",
    "Admin Alert: Server disk space reached critical levels. Admin team notified.",
    "Admin Backup: Full system backup completed successfully on 2023-09-01.",
    "Admin API Access: UserM accessed the API and retrieved customer data.",
    "UserN logged in from IP address 192.168.1.100 on 2023-09-12 at 10:30 AM.",
  ];

  final times = [
    "2023-09-08 15:45",
    "2023-09-09 09:30",
    "2023-09-10 14:15",
    "2023-09-11 11:20",
    "2023-09-12 16:00",
    "2023-09-13 10:05",
    "2023-09-14 13:55",
    "2023-09-13 18:30",
    "2023-09-10 08:45",
    "2023-09-15 12:10",
    "2023-09-05 17:25",
    "2023-09-06 14:50",
    "2023-09-07 09:15",
    "2023-09-04 22:30",
    "2023-09-01 02:00",
    "2023-09-02 19:45",
    "2023-09-12 10:30",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        shrinkWrap: true,
        itemCount: histories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              histories[index],
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w200,
              ),
            ),
            leading: const Icon(
              Icons.add_task,
              color: Color.fromARGB(255, 25, 27, 175),
            ),
            trailing: CustomText(
              times[index],
              fontSize: 15,
              fontColor: const Color.fromARGB(255, 48, 72, 150),
            ),
          );
        },
      ),
    );
  }
}
