import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/workout_model.dart';
import '../../../providers/editing_workout.dart';
import '../../../constants/styles.dart';
import '../../../providers/userWorkOut.dart';
import '../../modalPage/custom_modal.dart';
import 'exercise_info.dart';

class WorkoutPageLayout extends StatelessWidget {
  final int containerIndex;
  const WorkoutPageLayout({
    Key? key,
    required this.containerIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<UserWorkOutDataProvider, EditWorkOutDataProvider>(
        builder: (context, data, data2, child) {
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
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return ModalBottomSheet(
                                  isAnEdit: true,
                                  index: containerIndex,
                                );
                              }).whenComplete(() {
                            data2.toggleDeselect();
                            data2.userEditingWorkout.clear();
                          });

                          for (var workout
                              in data.userRecordedWorkouts[containerIndex]) {
                            data2.toggleSelectedStatus(workout);
                            data2.addWorkout(
                              WorkoutModel(
                                  title: workout.title,
                                  isSelected: workout.isSelected,
                                  reps: workout.reps,
                                  set: workout.set,
                                  weight: workout.weight),
                            );
                          }
                        },
                        icon: const Icon(
                          Icons.edit,
                        )),
                    IconButton(
                        onPressed: () {
                          data.removeRecordedWorkout(containerIndex);
                        },
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
