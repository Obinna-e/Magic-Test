import 'dart:collection';
import 'package:flutter/material.dart';

import 'package:magic_seniordev_test/models/recordedWorkOutModel.dart';
import 'package:magic_seniordev_test/models/workoutModel.dart';
import 'package:magic_seniordev_test/pages/homePage/widgets/workouts.dart';

class RecordedWorkOutProvider with ChangeNotifier {
  List<List<UnmodifiableListView>> recordedworkouts = [];

  void addWorkout(List<UnmodifiableListView<WorkoutModel>> workout) {
    recordedworkouts.add(workout);
    notifyListeners();
  }

  // void removeWorkout(List<UnmodifiableListView> workout, int index) {
  //   recordedworkouts[index].remove(workout);
  //   notifyListeners();
  // }

  void removeWorkout(int index) {
    recordedworkouts.removeAt(index);
    notifyListeners();
  }

  void clearWorkout(int index) {
    recordedworkouts[index].clear();
  }
}
