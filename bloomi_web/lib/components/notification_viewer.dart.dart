import 'package:flutter/material.dart';

class UtilFormMethodNotification {
  //---------------------------method to show dialog box input field---------------------------
  static showDialogMethod(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white, // Change the background color
          content: SizedBox(
            width: 800,
            height: 410,
            child: Column(
              children: [
                const Text(
                  'Notifications',
                  style: TextStyle(
                    fontSize: 24, // Increase the font size
                    fontWeight: FontWeight.bold,
                    color: Colors.blue, // Change the text color
                  ),
                ),
                const Divider(),
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final customerName = 'Customer Name $index';
                      final faculty = 'Faculty $index';
                      final date = 'Date $index';
                      final time = 'Time $index';
                      final email = 'Email $index';

                      return ListTile(
                        tileColor: Colors
                            .grey[200], // Change the tile background color
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Student Name: $customerName',
                              style: const TextStyle(
                                fontSize: 16, // Adjust the font size
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('Student Faculty: $faculty'),
                            Text('Appointment Date: $date'),
                            Text('Appointment Time: $time'),
                            Text('Student Email: $email'),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            MouseRegion(
                              onEnter: (_) {
                                (context as Element).markNeedsBuild();
                              },
                              onExit: (_) {
                                (context as Element).markNeedsBuild();
                              },
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                    (states) {
                                      if (states
                                          .contains(MaterialState.hovered)) {
                                        return Colors
                                            .blue; // Change to the hover color
                                      }
                                      return Colors
                                          .green; // Default button color
                                    },
                                  ),
                                  overlayColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                    (states) {
                                      if (states
                                          .contains(MaterialState.hovered)) {
                                        return Colors.blue.withOpacity(
                                            0.2); // Change to the overlay color when hovered
                                      }
                                      return Colors.green.withOpacity(
                                          0.2); // Default overlay color
                                    },
                                  ),
                                ),
                                child: const Text('Approve'),
                              ),
                            ),
                            const SizedBox(width: 10),
                            MouseRegion(
                              onEnter: (_) {
                                (context as Element).markNeedsBuild();
                              },
                              onExit: (_) {
                                (context as Element).markNeedsBuild();
                              },
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                    (states) {
                                      if (states
                                          .contains(MaterialState.hovered)) {
                                        return Colors
                                            .red; // Change to the hover color
                                      }
                                      return Colors
                                          .orange; // Default button color
                                    },
                                  ),
                                  overlayColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                    (states) {
                                      if (states
                                          .contains(MaterialState.hovered)) {
                                        return Colors.red.withOpacity(
                                            0.2); // Change to the overlay color when hovered
                                      }
                                      return Colors.orange.withOpacity(
                                          0.2); // Default overlay color
                                    },
                                  ),
                                ),
                                child: const Text('Decline'),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
