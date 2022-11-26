import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:magic_seniordev_test/constants/styles.dart';
import 'package:magic_seniordev_test/providers/recordedWorkOut.dart';
import 'package:magic_seniordev_test/providers/workOutData.dart';
import 'package:provider/provider.dart';
import '../customModal.dart';

typedef void StringCallBack(String val);

class EditWorkout extends StatelessWidget {
  const EditWorkout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<WorkOutDataProvider, RecordedWorkOutProvider>(
        builder: (context, workoutProvider, recordedDataProvider, child) {
      return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: workoutProvider.userWorkouts.length,
        itemBuilder: (context, index) {
          final workout = workoutProvider.userWorkouts[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: defaultPadding,
                child: Text(
                  workout.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      const Padding(
                        padding: defaultPadding,
                        child: Text('Set'),
                      ),
                      Text('${index + 1}'),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      const Padding(
                        padding: defaultPadding,
                        child: Text('kg'),
                      ),
                      SizedBox(
                        height: 30,
                        width: 100,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          onChanged: (value) {
                            workout.weight = int.tryParse(value);
                          },
                          decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            hintText: 'Enter Weight',
                            border: OutlineInputBorder(
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
                      const Padding(
                        padding: defaultPadding,
                        child: Text('Reps'),
                      ),
                      SizedBox(
                        height: 30,
                        width: 100,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          onChanged: (value) {
                            workout.reps = int.tryParse(value);
                          },
                          decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            hintText: 'Enter Reps',
                            border: OutlineInputBorder(
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
          );
        },
      );
    });
  }
}
