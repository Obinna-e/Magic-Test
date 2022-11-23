import 'package:flutter/material.dart';
import 'package:magic_seniordev_test/Widgets/workoutItems.dart';
import 'package:magic_seniordev_test/models/workoutModel.dart';

import '../constants/styles.dart';

class ModalBottomSheet extends StatefulWidget {
  const ModalBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<ModalBottomSheet> createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  List<WorkoutModel> workouts = [
    WorkoutModel(
      'barbell_row.png',
      'Back',
      'Barbell Row',
      false,
    ),
    WorkoutModel(
      'bench_press.jpeg',
      'Chest',
      'Bench Press',
      false,
    ),
    WorkoutModel(
      'shoulder_press.jpeg',
      'Shoulders',
      'Shoulder Press',
      false,
    ),
    WorkoutModel(
      'deadlift.jpg',
      'Legs',
      'Deadlift',
      false,
    ),
    WorkoutModel(
      'squat.png',
      'Legs',
      'Squat',
      false,
    ),
  ];

  List<WorkoutModel> selectedWorkouts = [];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

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
                style: ElevatedButton.styleFrom(primary: Colors.lightBlue[100]),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
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
                                        itemCount: workouts.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return WorkoutItems(
                                              workouts[index].img,
                                              workouts[index].title,
                                              workouts[index].subtitle,
                                              workouts[index].isSelected,
                                              index);
                                        },
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                          'Add ${selectedWorkouts.length}'),
                                    ),
                                  ],
                                )),
                          ),
                        );
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
                  style:
                      ElevatedButton.styleFrom(primary: Colors.deepOrange[100]),
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
  }

  Widget WorkoutItems(
      String img, String title, String subtitle, bool isSelected, int index) {
    return ListTile(
      leading: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 44,
          minHeight: 44,
          maxWidth: 80,
          maxHeight: 80,
        ),
        child: Image.asset(
          'assets/images/${img}',
          height: 75,
          width: 75,
        ),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: isSelected
          ? Icon(Icons.check_circle, color: Colors.blue)
          : Icon(
              Icons.check_circle_outline,
              color: Colors.grey,
            ),
      onTap: () {
        setState(() {
          workouts[index].isSelected = !isSelected;

          if (workouts[index].isSelected == true) {
            selectedWorkouts.add(WorkoutModel(img, title, subtitle, true));
          } else if (workouts[index].isSelected == false) {
            selectedWorkouts.removeWhere(
                (element) => element.title == workouts[index].title);
          }
        });
      },
    );
  }
}
