import 'package:flutter/material.dart';
import 'package:magic_seniordev_test/Widgets/workoutItems.dart';
import 'package:magic_seniordev_test/Widgets/workoutList.dart';
import 'package:magic_seniordev_test/models/recordedWorkOut.dart';
import 'package:magic_seniordev_test/models/recordedWorkOutModel.dart';
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

  static _ModalBottomSheetState? of(BuildContext context) =>
      context.findAncestorStateOfType<_ModalBottomSheetState>();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  String _weight = '';
  String _reps = '';
  String _set = '';

  set weight(String value) => setState(() => _weight = value);
  set rep(String value) => setState(() => _reps = value);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Consumer<WorkOutData>(builder: (context, data, child) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                    onPressed: () {
                      for (var i = 0; i < data.selectedWorkouts.length; i++) {
                        Provider.of<RecordedWorkOutData>(context, listen: false)
                            .addWorkout(RecordedWorkOutModel(
                                workout: data.selectedWorkouts[i],
                                repetition: _reps,
                                weigth: _weight,
                                set: _set));
                      }

                      Navigator.pop(context);
                      data.clearWorkout();
                    },
                    child: Text('Finish')),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'WorkOut Name',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              WorkoutList(
                callBack: (val) {
                  setState(() {
                    _weight = val;
                    _reps = val;
                  });
                },
              ),
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: defaultPadding,
                child: Container(
                  width: width * 0.98,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.lightBlue[100]),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Consumer<WorkOutData>(
                                builder: (context, data, child) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
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
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return WorkoutItems(
                                                    img: data
                                                        .workouts[index].img,
                                                    title: data
                                                        .workouts[index].title,
                                                    subtitle: data
                                                        .workouts[index]
                                                        .subtitle,
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
                        data.clearWorkout();
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
        ),
      );
    });
  }
}
