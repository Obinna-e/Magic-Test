import 'package:flutter/material.dart';
import 'package:magic_seniordev_test/providers/recordedWorkOut.dart';
import 'package:magic_seniordev_test/providers/workOutData.dart';
import 'package:provider/provider.dart';

class RecordedWorkoutList extends StatelessWidget {
  const RecordedWorkoutList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RecordedWorkOutProvider>(builder: (context, data, child) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: data.recordedworkouts.length,
          itemBuilder: (context, index) {
            final workout = data.recordedworkouts[index];

            return GestureDetector(
              onLongPress: () => data.removeWorkout(workout),
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.fromLTRB(12, 5, 8, 5),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        'Set 1: ${workout.workout.title} - ${workout.weigth}, ${workout.repetition} repetitions'),

                    // switch case
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
