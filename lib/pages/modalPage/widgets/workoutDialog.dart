import 'package:flutter/material.dart';
import 'package:magic_seniordev_test/models/workoutModel.dart';
import 'package:magic_seniordev_test/providers/userWorkOut.dart';

import 'package:magic_seniordev_test/providers/workOutData.dart';
import 'package:provider/provider.dart';

class WorkoutItems extends StatelessWidget {
  const WorkoutItems(
      {Key? key,
      required this.img,
      required this.title,
      required this.subtitle,
      required this.isSelected,
      required this.index})
      : super(key: key);

  final String img;
  final String title;
  final String subtitle;
  final bool isSelected;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer2<WorkOutDataProvider, UserWorkOutDataProvider>(
        builder: (context, data, data2, child) {
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
        trailing: data.workouts[index].isSelected
            ? const Icon(Icons.check_circle, color: Colors.blue)
            : const Icon(
                Icons.check_circle_outline,
                color: Colors.grey,
              ),
        onTap: () {
          data.workouts[index].toggle();
          if (data.workouts[index].isSelected == true) {
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
        },
      );
    });
  }
}
