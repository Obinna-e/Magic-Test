import 'package:flutter/material.dart';

import 'package:magic_seniordev_test/pages/modalPage/widgets/workoutList.dart';
import 'package:magic_seniordev_test/providers/recordedWorkOut.dart';
import 'package:magic_seniordev_test/models/recordedWorkOutModel.dart';
import 'package:magic_seniordev_test/providers/workOutData.dart';
import 'package:provider/provider.dart';

import '../../../constants/styles.dart';
import 'widgets/selectableWorkout.dart';

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

    return Consumer2<WorkOutDataProvider, RecordedWorkOutProvider>(
        builder: (context, data, data2, child) {
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
                        data2.addWorkout(RecordedWorkOutModel(
                            workout: data.selectedWorkouts[i],
                            repetition: _reps,
                            weigth: _weight,
                            set: _set));
                      }

                      Navigator.pop(context);
                      data.clearWorkout();
                    },
                    child: const Text('Finish')),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'WorkOut Name',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              EditWorkout(
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
                            return SelectableWorkout(
                                height: height, width: width);
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
