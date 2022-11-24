import 'package:flutter/material.dart';
import 'package:magic_seniordev_test/Widgets/workoutItems.dart';
import 'package:magic_seniordev_test/models/workOutData.dart';
import 'package:provider/provider.dart';

import '../constants/styles.dart';
import '../models/workoutModel.dart';

class ModalBottomSheet extends StatefulWidget {
  const ModalBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<ModalBottomSheet> createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  // List<WorkoutModel> workouts = [
  //   WorkoutModel(
  //     img: 'barbell_row.png',
  //     subtitle: 'Back',
  //     title: 'Barbell Row',
  //     isSelected: false,
  //   ),
  //   WorkoutModel(
  //     img: 'bench_press.jpeg',
  //     subtitle: 'Chest',
  //     title: 'Bench Press',
  //     isSelected: false,
  //   ),
  //   WorkoutModel(
  //     img: 'shoulder_press.jpeg',
  //     subtitle: 'Shoulders',
  //     title: 'Shoulder Press',
  //     isSelected: false,
  //   ),
  //   WorkoutModel(
  //     img: 'deadlift.jpg',
  //     subtitle: 'Legs',
  //     title: 'Deadlift',
  //     isSelected: false,
  //   ),
  //   WorkoutModel(
  //     img: 'squat.png',
  //     subtitle: 'Legs',
  //     title: 'Squat',
  //     isSelected: false,
  //   ),
  // ];

  // List<WorkoutModel> selectedWorkouts = [];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Consumer<WorkOutData>(builder: (context, data, child) {
      return Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'WorkOut Name',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: defaultPadding,
              child: Container(
                width: width * 0.98,
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(primary: Colors.lightBlue[100]),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Consumer<WorkOutData>(
                              builder: (context, data, child) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      20.0)), //this right here
                              child: Container(
                                height: height * 0.5,
                                width: width * 0.98,
                                child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: ListView.builder(
                                            itemCount: data.workouts.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return WorkoutItems(
                                                  img: data.workouts[index].img,
                                                  title: data
                                                      .workouts[index].title,
                                                  subtitle: data
                                                      .workouts[index].subtitle,
                                                  isSelected: data
                                                      .workouts[index]
                                                      .isSelected,
                                                  index: index);
                                            },
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                              'Add ${data.selectedWorkouts.isEmpty ? "" : "(${data.selectedWorkouts.length})"}'),
                                        ),
                                      ],
                                    )),
                              ),
                            );
                          });
                        });
                  },
                  child: const Text(
                    'Add Exercises',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ),
            Padding(
              padding: defaultPadding,
              child: SizedBox(
                width: width * 0.98,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.deepOrange[100]),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Cancel Workout',
                      style: TextStyle(color: Colors.red),
                    )),
              ),
            ),
          ],
        ),
      );
    });
  }
}
