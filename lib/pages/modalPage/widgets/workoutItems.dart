import 'package:flutter/material.dart';

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
    return Consumer<WorkOutDataProvider>(builder: (context, data, child) {
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
        trailing: data.selectedWorkouts[index].isSelected
            ? const Icon(Icons.check_circle, color: Colors.blue)
            : const Icon(
                Icons.check_circle_outline,
                color: Colors.grey,
              ),
        onTap: () {
          data.selectedWorkouts[index].toggle();
          if (data.selectedWorkouts[index].isSelected == true) {
            data.addWorkout(data.selectedWorkouts[index]);
          } else if (data.selectedWorkouts[index].isSelected == false) {
            data.removeWorkout(data.selectedWorkouts[index]);
          }
        },
      );
    });
  }
}
