import 'package:bloomi/components/custom_text.dart';
import 'package:bloomi/screens/home/Appointment/dashboard.dart';
import 'package:flutter/material.dart';

class HomeNabBar extends StatefulWidget {
  const HomeNabBar({Key? key}) : super(key: key);

  @override
  State<HomeNabBar> createState() => _HomeNabBarState();
}

class _HomeNabBarState extends State<HomeNabBar> {
  int _currentIndex = 0; // To track the currently selected tab index

  // List of destinations for the bottom navigation bar
  final List<Widget> _destinations = [
    const Center(child: CustomText("Tab 1")),
    const Center(child: CustomText("Tab 2")),
    const Dashboard(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _destinations[_currentIndex], // Display the currently selected tab
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the selected tab index
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Tab 1",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Tab 2",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Tab 3",
          ),
        ],
      ),
    );
  }
}
