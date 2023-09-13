import 'package:flutter/material.dart';

class MessagingCard extends StatefulWidget {
  @override
  _MessagingCardState createState() => _MessagingCardState();
}

class _MessagingCardState extends State<MessagingCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 159, 218, 245),
      margin: EdgeInsets.all(10),
      elevation: 2,
      child: InkWell(
        onTap: () {
          // Handle tap event here
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Student 1',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(width: 10),
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 20,
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Divider(),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          'Student 2',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(width: 10),
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 20,
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Divider(),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          'Student 3',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(width: 10),
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 20,
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      'Message',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
