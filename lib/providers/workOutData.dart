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

  late List<WorkoutModel> selectedWorkouts = List.from(workouts);
  List<WorkoutModel> userWorkouts = [];

  // List<List<WorkoutModel>> userWorkouts = [];
  // UnmodifiableListView<WorkoutModel> get selectedWorkouts =>
  //     UnmodifiableListView(_selectedWorkouts);

  // UnmodifiableListView<WorkoutModel> get workouts =>
  //     UnmodifiableListView(_workouts);

  // void addWorkout(WorkoutModel workout) {
  //   selectedWorkouts.add(workout);

  //   notifyListeners();
  // }

  // void selectWorkout(WorkoutModel workout) {
  //   selectedWorkouts = notifyListeners();
  // }

  void addWorkout(WorkoutModel workout) {
    userWorkouts.add(workout);
    notifyListeners();
  }

  void toggleWorkout(WorkoutModel workout) {
    workout.toggle();
    notifyListeners();
  }

  void removeWorkout(WorkoutModel workout) {
    userWorkouts.remove(workout);
    notifyListeners();
  }

  void clearWorkout() {
    userWorkouts.clear();
  }
}
