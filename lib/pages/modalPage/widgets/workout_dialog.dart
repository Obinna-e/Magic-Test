import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/workout_model.dart';
import '../../../providers/editing_workout.dart';
import '../../../providers/user_workout.dart';
import '../../../providers/work_out_data.dart';

class WorkoutItems extends StatelessWidget {
  const WorkoutItems({
    Key? key,
    required this.isAnEdit,
    required this.img,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.index,
    this.containerIndex,
  }) : super(key: key);

  final String img;
  final String title;
  final String subtitle;
  final bool isSelected;
  final int index;
  final bool isAnEdit;
  final int? containerIndex;

  @override
  Widget build(BuildContext context) {
    return Consumer3<WorkOutDataProvider, UserWorkOutDataProvider,
        EditWorkOutDataProvider>(builder: (context, data, data2, data3, child) {
      final workoutdata =
          isAnEdit ? data3.workouts[index] : data.workouts[index];
      return ListTile(
        leading: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 44,
            minHeight: 44,
            maxWidth: 80,
            maxHeight: 80,
          ),
          child: Image.asset(
            'assets/images/$img',
            height: 75,
            width: 75,
          ),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: workoutdata.isSelected
            ? const Icon(Icons.check_circle, color: Colors.blue)
            : const Icon(
                Icons.check_circle_outline,
                color: Colors.grey,
              ),
        onTap: () {
          workoutdata.toggle();
          if (!isAnEdit) {
            if (workoutdata.isSelected == true) {
              data2.addWorkout(WorkoutModel(
                title: data.workouts[index].title,
                set: data.workouts[index].set,
                reps: data.workouts[index].reps,
                weight: data.workouts[index].weight,
                isSelected: data.workouts[index].isSelected,
                img: data.workouts[index].img,
                subtitle: data.workouts[index].subtitle,
              ));
            } else if (data.workouts[index].isSelected == false) {
              data2.removeWorkout(data.workouts[index].title);
            }
          } else {
            if (workoutdata.isSelected == true) {
              data3.addWorkout(WorkoutModel(
                title: data.workouts[index].title,
                set: data.workouts[index].set,
                reps: data.workouts[index].reps,
                weight: data.workouts[index].weight,
                isSelected: data.workouts[index].isSelected,
                img: data.workouts[index].img,
                subtitle: data.workouts[index].subtitle,
              ));
            } else if (workoutdata.isSelected == false) {
              data3.removeWorkout(data3.workouts[index].title);
            }
          }
        },
      );
    });
  }
}
