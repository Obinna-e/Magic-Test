import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../constants/styles.dart';
import '../../../providers/editingWorkout.dart';
import '../../../providers/userWorkOut.dart';

typedef void StringCallBack(String val);

class EditWorkout extends StatelessWidget {
  final bool isAnEdit;
  final int? containerIndex;
  const EditWorkout({
    Key? key,
    required this.isAnEdit,
    this.containerIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<UserWorkOutDataProvider, EditWorkOutDataProvider>(
      builder: ((context, data, data2, child) {
        return Column(
          children: [
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: isAnEdit
                  ? data2.userEditingWorkout.length
                  : data.userEditingWorkout.length,
              itemBuilder: (context, index) {
                final workout = isAnEdit
                    ? data2.userEditingWorkout[index]
                    : data.userEditingWorkout[index];

                workout.set = index + 1;

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
                            Text(workout.set.toString()),
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
            ),
          ],
        );
      }),
    );
  }
}
