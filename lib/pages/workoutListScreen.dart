import 'package:flutter/material.dart';
import 'package:magic_seniordev_test/Widgets/recordedWorkoutList.dart';

import '../Widgets/workoutList.dart';

class ListOfWorkouts extends StatelessWidget {
  const ListOfWorkouts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        const Text(
          'History',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        RecordedWorkoutList(),
      ],
    );
  }
}
