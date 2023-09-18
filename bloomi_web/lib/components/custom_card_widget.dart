import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: UtilConstants.lightgreyColor,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
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
            SizedBox(
              height: 8,
              child: Divider(
                thickness: 1,
              ),
            ),
            Text('Full Name:'),
            SizedBox(height: 4),
            Text('Email:'),
            SizedBox(height: 4),
            Text('Counsellor:'),
            SizedBox(height: 4),
            Text('Date:'),
            SizedBox(height: 4),
            Text('Time:'),
          ],
        ),
      ),
    );
  }
}
