import 'package:bloomi_web/models/objects.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final List<AppointmentModel> list;
  const CustomCardWidget({
    super.key,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Make the card expand to the full width
      child: Card(
        color: UtilConstants.lightgreyColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Padding(
          padding: EdgeInsets.all(16), // Adjust padding as needed
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(
                thickness: 1,
                height: 16, // Adjust the height of the divider
              ),
              Text('Full Name:'),
              Text('Email:'),
              Text('Counsellor:'),
              Text('Date:'),
              Text('Time:'),
            ],
          ),
        ),
      ),
    );
  }
}
