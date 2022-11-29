import 'package:flutter/material.dart';

import '../RecordedWorkoutPage/recorded_workout_page.dart';
import '../modalPage/custom_modal.dart';
import 'widgets/workout_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const List<Widget> pages = [
      WorkOutScreen(),
      RecordedWorkoutScreen(),
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: pages.elementAt(_selectedIndex)),
      ),
      bottomNavigationBar: BottomNavigationBar(
        key: const Key('bottom'),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_gymnastics),
            label: "workoutScreen",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.timer), label: "Workout List"),
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return const ModalBottomSheet(
                  isAnEdit: false,
                );
              });
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
