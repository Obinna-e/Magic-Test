import 'dart:collection';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

import '../models/workoutModel.dart';

class UserWorkOutDataProvider extends ChangeNotifier {
  List<List<WorkoutModel>> userRecordedWorkouts = [];
  List<WorkoutModel> userEditingWorkout = [];

  void addWorkout(WorkoutModel workout) {
    userEditingWorkout.add(workout);
    notifyListeners();
  }

  void removeWorkout(String title) {
    userEditingWorkout.removeWhere((element) => element.title == title);
    notifyListeners();
  }

  void addRecordedWorkout(List<WorkoutModel> workout) {
    userRecordedWorkouts.add([...workout]);
    notifyListeners();
  }

  void removeRecordedWorkout(int index) {
    userRecordedWorkouts.removeAt(index);
    notifyListeners();
  }

  void updateWorkout(
      WorkoutModel workout, String title, int reps, int weight, int index) {
    workout.title = title;
    workout.reps = reps;
    workout.weight = weight;

    notifyListeners();
  }
}
