import 'dart:collection';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

import '../models/workoutModel.dart';

class WorkOutDataProvider with ChangeNotifier {
  List<WorkoutModel> _workouts = [
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

  List<WorkoutModel> _selectedWorkouts = [];
  UnmodifiableListView<WorkoutModel> get selectedWorkouts =>
      UnmodifiableListView(_selectedWorkouts);

  UnmodifiableListView<WorkoutModel> get workouts =>
      UnmodifiableListView(_workouts);

  void addWorkout(WorkoutModel workout) {
    _selectedWorkouts.add(workout);
    notifyListeners();
  }

  void toggleWorkout(WorkoutModel workout) {
    workout.toggle();
    notifyListeners();
  }

  void removeWorkout(WorkoutModel workout) {
    _selectedWorkouts.remove(workout);
    notifyListeners();
  }

  void clearWorkout() {
    _selectedWorkouts.clear();
    for (WorkoutModel workout in workouts) {
      workout.isSelected = false;
      // workout.reps = 0;
      // workout.set = 0;
      // workout.weight = 0;
    }
  }
}
