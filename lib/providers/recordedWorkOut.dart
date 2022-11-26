import 'dart:collection';
import 'package:flutter/material.dart';

import 'package:magic_seniordev_test/models/recordedWorkOutModel.dart';
import 'package:magic_seniordev_test/models/workoutModel.dart';
import 'package:magic_seniordev_test/pages/homePage/widgets/workouts.dart';

class RecordedWorkOutProvider with ChangeNotifier {
  List<WorkoutModel> _recordedworkouts = [];

  UnmodifiableListView<WorkoutModel> get recordedworkouts =>
      UnmodifiableListView(_recordedworkouts);

  void addWorkout(WorkoutModel workout) {
    _recordedworkouts.add(workout);
    notifyListeners();
  }

  void removeWorkout(WorkoutModel workout) {
    _recordedworkouts.remove(workout);
    notifyListeners();
  }

  void clearWorkout() {
    _recordedworkouts.clear();
  }
}
