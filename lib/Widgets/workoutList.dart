import 'package:flutter/material.dart';
import 'package:magic_seniordev_test/models/workOutData.dart';
import 'package:provider/provider.dart';

class WorkoutList extends StatelessWidget {
  const WorkoutList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkOutData>(builder: (context, data, child) {
      return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: data.selectedWorkouts.length,
        itemBuilder: (context, index) {
          final workout = data.selectedWorkouts[index];

          // gesture detection
          return GestureDetector(
            onLongPress: () => data.removeWorkout(workout),
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.fromLTRB(12, 5, 8, 5),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // text field
                  Text(
                    workout.title,
                    style: TextStyle(
                        decoration: workout.isSelected
                            ? TextDecoration.lineThrough
                            : null,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),

                  // switch case
                  Switch(
                    value: workout.isSelected,
                    onChanged: (c) => data.toggleWorkout(workout),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
