import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Sachith Dissanayaka',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              // Handle Home button tap
            },
          ),
          ListTile(
            title: const Text('Appointment'),
            onTap: () {
              // Handle Appointment button tap
            },
          ),
          ListTile(
            title: const Text('Contact'),
            onTap: () {
              // Handle Contact button tap
            },
          ),
          ListTile(
            title: const Text('Profile'),
            onTap: () {
              // Handle Profile button tap
            },
          ),
        ],
      ),
    );
  }
}
