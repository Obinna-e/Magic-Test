import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/user_workout.dart';

class ExerciseInfo extends StatelessWidget {
  final String workoutName;
  final String weight;
  final String reps;
  final String set;

  const ExerciseInfo({
    Key? key,
    required this.workoutName,
    required this.weight,
    required this.reps,
    required this.set,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserWorkOutDataProvider>(builder: (context, data, child) {
      return Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2, bottom: 2),
            child: Text('Set $set: $workoutName'),
          ),
          const SizedBox(
            width: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2, bottom: 2),
            child: Text('$weight kg x $reps'),
          ),
        ],
      );
    });
  }
}
