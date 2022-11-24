import 'dart:collection';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

import './workoutModel.dart';

class WorkOutData with ChangeNotifier {
  List<WorkoutModel> _workouts = [
    WorkoutModel(
      img: 'barbell_row.png',
      subtitle: 'Back',
      title: 'Barbell Row',
      isSelected: false,
    ),
    WorkoutModel(
      img: 'bench_press.jpeg',
      subtitle: 'Chest',
      title: 'Bench Press',
      isSelected: false,
    ),
    WorkoutModel(
      img: 'shoulder_press.jpeg',
      subtitle: 'Shoulders',
      title: 'Shoulder Press',
      isSelected: false,
    ),
    WorkoutModel(
      img: 'deadlift.jpg',
      subtitle: 'Legs',
      title: 'Deadlift',
      isSelected: false,
    ),
    WorkoutModel(
      img: 'squat.png',
      subtitle: 'Legs',
      title: 'Squat',
      isSelected: false,
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
  }
}
