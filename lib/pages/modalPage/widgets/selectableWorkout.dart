import 'package:flutter/material.dart';
import 'package:magic_seniordev_test/providers/editingWorkout.dart';
import 'package:provider/provider.dart';

import 'workoutDialog.dart';
import '../../../providers/workOutData.dart';

class SelectableWorkout extends StatelessWidget {
  final bool isAnEdit;
  final int? containerIndex;
  const SelectableWorkout({
    Key? key,
    required this.isAnEdit,
    required this.height,
    required this.width,
    this.containerIndex,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Consumer2<WorkOutDataProvider, EditWorkOutDataProvider>(
        builder: (context, data, data2, child) {
      final workout = isAnEdit ? data2.workouts : data.workouts;
      return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: SizedBox(
          height: height * 0.5,
          width: width * 0.98,
          child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: workout.length,
                      itemBuilder: (BuildContext context, int index) {
                        return WorkoutItems(
                            isAnEdit: isAnEdit,
                            img: workout[index].img!,
                            title: workout[index].title,
                            subtitle: workout[index].subtitle!,
                            isSelected: workout[index].isSelected,
                            index: index);
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Done'),
                  ),
                ],
              )),
        ),
      );
    });
  }
}
