import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/styles.dart';
import '../../providers/user_workout.dart';
import 'widgets/work_out_page_layout.dart';

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
                key: Key('history'),
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
                );
              },
            ),
          ],
        ),
      );
    });
  }
}
