import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magic_seniordev_test/Widgets/customModal.dart';
import 'package:magic_seniordev_test/constants/styles.dart';
import 'package:magic_seniordev_test/models/recordedWorkOut.dart';
import 'package:magic_seniordev_test/models/recordedWorkOutModel.dart';
import 'package:magic_seniordev_test/models/workOutData.dart';
import 'package:provider/provider.dart';

typedef void StringCallBack(String val);

class WorkoutList extends StatelessWidget {
  final StringCallBack callBack;
  const WorkoutList({Key? key, required this.callBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String weight = '';
    String reps = '';
    return Consumer2<WorkOutData, RecordedWorkOutData>(
        builder: (context, workoutProvider, recordedDataProvider, child) {
      return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: workoutProvider.selectedWorkouts.length,
        itemBuilder: (context, index) {
          final workout = workoutProvider.selectedWorkouts[index];

          // gesture detection
          return GestureDetector(
            onLongPress: () => workoutProvider.removeWorkout(workout),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: defaultPadding,
                  child: Text(
                    workout.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: defaultPadding,
                          child: Text('Set'),
                        ),
                        Text('${index + 1}'),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Padding(
                          padding: defaultPadding,
                          child: Text('kg'),
                        ),
                        Container(
                          height: 30,
                          width: 100,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            onChanged: (value) {
                              ModalBottomSheet.of(context)?.weight = value;
                            },
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              hintText: 'Enter Weight',
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        Padding(
                          padding: defaultPadding,
                          child: Text('Reps'),
                        ),
                        Container(
                          height: 30,
                          width: 100,
                          child: TextField(
                            onChanged: (value) {
                              reps = value;
                              ModalBottomSheet.of(context)?.rep = value;
                            },
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              hintText: 'Enter Reps',
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          );
        },
      );
    });
  }
}
