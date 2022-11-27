import 'package:flutter/material.dart';

import 'package:magic_seniordev_test/constants/styles.dart';
import 'package:provider/provider.dart';
import '../../providers/userWorkOut.dart';
import '../modalPage/customModal.dart';
import './widgets/workOutPageLayout.dart';

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
                          return const ModalBottomSheet();
                        });
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
