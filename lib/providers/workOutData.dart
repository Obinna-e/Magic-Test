import 'dart:async';
import 'dart:collection';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

import '../models/workoutModel.dart';

class WorkOutDataProvider extends ChangeNotifier {
  List<WorkoutModel> workouts = [
    WorkoutModel(
      img: 'barbell_row.png',
      subtitle: 'Back',
      title: 'Barbell Row',
      isSelected: false,
      set: 0,
      weight: 0,
      reps: 0,
    ),
    WorkoutModel(
      img: 'bench_press.jpeg',
      subtitle: 'Chest',
      title: 'Bench Press',
      isSelected: false,
      set: 0,
      weight: 0,
      reps: 0,
    ),
    WorkoutModel(
      img: 'shoulder_press.jpeg',
      subtitle: 'Shoulders',
      title: 'Shoulder Press',
      isSelected: false,
      set: 0,
      weight: 0,
      reps: 0,
    ),
    WorkoutModel(
      img: 'deadlift.jpg',
      subtitle: 'Legs',
      title: 'Deadlift',
      isSelected: false,
      set: 0,
      weight: 0,
      reps: 0,
    ),
    WorkoutModel(
      img: 'squat.png',
      subtitle: 'Legs',
      title: 'Squat',
      isSelected: false,
      set: 0,
      weight: 0,
      reps: 0,
    ),
  ];

  // List<WorkoutModel> get workout =>
  //     _workouts.where((workout) => workout.isSelected == false).toList();

  // List<WorkoutModel> get selectedWorkout =>
  //     _workouts.where((workout) => workout.isSelected == true).toList();

  void toggleSelectedStatus(WorkoutModel workout) {
    for (var item in workouts) {
      if (item.title == workout.title) {
        item.isSelected = true;
      }
    }

    notifyListeners();
  }

  Future<bool> toggleDeselect() {
    for (var item in workouts) {
      item.isSelected = false;
    }
    var finished = Completer<bool>();
    notifyListeners();
    return finished.future;
  }
}
