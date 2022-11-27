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

  void editRecordedWorkout(List<WorkoutModel> workout, index) {
    userRecordedWorkouts[index] = [...workout];

    notifyListeners();
  }
}
