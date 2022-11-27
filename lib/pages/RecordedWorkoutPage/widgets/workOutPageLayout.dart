import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/styles.dart';
import '../../../providers/userWorkOut.dart';
import './exerciseInfo.dart';

class WorkoutPageLayout extends StatelessWidget {
  final VoidCallback onTapDeleteIcon;
  final VoidCallback onTapEditIcon;
  final int containerIndex;
  const WorkoutPageLayout({
    Key? key,
    required this.onTapDeleteIcon,
    required this.onTapEditIcon,
    required this.containerIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserWorkOutDataProvider>(builder: (context, data, child) {
      return Padding(
        padding: defaultPadding,
        child: Container(
          margin: const EdgeInsets.all(5.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //TODO: Make this dynamic with dateTime
              Padding(
                padding: defaultPadding,
                child: Row(
                  children: [
                    const Text(
                      'Midnight Workout',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: onTapEditIcon,
                        icon: const Icon(
                          Icons.edit,
                        )),
                    IconButton(
                        onPressed: onTapDeleteIcon,
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                  ],
                ),
              ),
              const Text('Date and Time of workout'),
              Padding(
                padding: defaultPadding,
                child: Row(
                  children: const [
                    Text('Exercise'),
                    SizedBox(
                      width: 145,
                    ),
                    Text('Reps'),
                  ],
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.userRecordedWorkouts[containerIndex].length,
                  itemBuilder: (BuildContext context, index) {
                    return ExerciseInfo(
                      workoutName: data
                          .userRecordedWorkouts[containerIndex][index].title,
                      weight: data
                          .userRecordedWorkouts[containerIndex][index].weight
                          .toString(),
                      reps: data
                          .userRecordedWorkouts[containerIndex][index].reps
                          .toString(),
                      set: data.userRecordedWorkouts[containerIndex][index].set
                          .toString(),
                    );
                  }),
            ],
          ),
        ),
      );
    });
  }
}
