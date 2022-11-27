import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'workoutDialog.dart';
import '../../../providers/workOutData.dart';

class SelectableWorkout extends StatelessWidget {
  const SelectableWorkout({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkOutDataProvider>(builder: (context, data, child) {
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
                      itemCount: data.workouts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return WorkoutItems(
                            img: data.workouts[index].img!,
                            title: data.workouts[index].title,
                            subtitle: data.workouts[index].subtitle!,
                            isSelected: data.workouts[index].isSelected,
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
