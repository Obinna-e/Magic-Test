import 'package:flutter/material.dart';
import 'package:magic_seniordev_test/constants/widgets/customButton.dart';
import 'package:magic_seniordev_test/models/workoutModel.dart';

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
  // String _weight = '';
  // String _reps = '';
  // String _set = '';

  // set weight(String value) => setState(() => _weight = value);
  // set rep(String value) => setState(() => _reps = value);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Consumer2<WorkOutDataProvider, RecordedWorkOutProvider>(
        builder: (context, data, data2, child) {
      return Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0))),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topRight,
                    child: CustomButton(
                      title: 'Finish',
                      width: width * 0.2,
                      onTap: () {
                        for (var i = 0; i < data.selectedWorkouts.length; i++) {
                          data2.addWorkout(
                            data.selectedWorkouts[i],
                          );
                        }
                        Navigator.pop(context);
                        data.clearWorkout();
                      },
                    )),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'New Workout',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                EditWorkout(),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  width: width * 0.98,
                  title: 'Add Exercises',
                  textColor: Colors.blue,
                  buttonColor: Colors.lightBlue[100],
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return SelectableWorkout(
                              height: height, width: width);
                        });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: CustomButton(
                    width: width * 0.98,
                    title: 'Cancel Workout',
                    textColor: Colors.red,
                    buttonColor: Colors.deepOrange[100],
                    onTap: () {
                      data.clearWorkout();
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
