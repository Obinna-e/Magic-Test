import 'package:flutter/material.dart';

import 'package:magic_seniordev_test/constants/styles.dart';
import 'package:provider/provider.dart';
import '../../providers/userWorkOut.dart';
import '../modalPage/customModal.dart';

class RecordedWorkoutScreen extends StatelessWidget {
  const RecordedWorkoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserWorkOutDataProvider>(builder: (context, data, child) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: defaultPadding,
              child: Text(
                'History',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: data.userRecordedWorkouts.length,
              itemBuilder: (BuildContext context, index) {
                return WorkoutPageLayout(
                  containerIndex: index,
                  onTapDeleteIcon: () {
                    data.removeRecordedWorkout(index);
                  },
                  onTapEditIcon: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return ModalBottomSheet();
                        });
                    print('object');
                  },
                );
              },
            ),
          ],
        ),
      );
    });
  }
}

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
                    Text(
                      'Midnight Workout',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    PopupMenuButton<Widget>(
                      itemBuilder: (BuildContext context) => [
                        PopupMenuItem(
                          child: Row(
                            children: [
                              Text(
                                'Delete Workout',
                                style: TextStyle(color: Colors.red),
                              ),
                              Spacer(),
                              Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ],
                          ),
                          onTap: onTapDeleteIcon,
                        ),
                        PopupMenuDivider(),
                        PopupMenuItem(
                          child: Row(
                            children: [
                              Text('Edit Workout'),
                              Spacer(),
                              Icon(Icons.edit),
                            ],
                          ),
                          onTap: onTapEditIcon,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text('Date and Time of workout'),
              Padding(
                padding: defaultPadding,
                child: Row(
                  children: [
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

class ExerciseInfo extends StatelessWidget {
  final String workoutName;
  final String weight;
  final String reps;
  final String set;

  const ExerciseInfo({
    Key? key,
    required this.workoutName,
    required this.weight,
    required this.reps,
    required this.set,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserWorkOutDataProvider>(builder: (context, data, child) {
      return Row(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2, bottom: 2),
            child: Text('Set $set: $workoutName'),
          ),
          SizedBox(
            width: 100,
          ),
          Padding(
            padding: EdgeInsets.only(top: 2, bottom: 2),
            child: Text('$weight kg x $reps'),
          ),
        ],
      );
    });
  }
}
