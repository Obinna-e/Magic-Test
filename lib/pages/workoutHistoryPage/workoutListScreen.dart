import 'package:flutter/material.dart';

import './widgets/recordedWorkoutList.dart';

class ListOfWorkouts extends StatelessWidget {
  const ListOfWorkouts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const <Widget>[
        Text(
          'History',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        RecordedWorkoutList(),
      ],
    );
  }
}
