// import 'dart:collection';
// import 'package:flutter/foundation.dart';

// import 'package:flutter/material.dart';

// import '../models/workoutModel.dart';

// class WorkOutDataProvider with ChangeNotifier {
//   List<WorkoutModel> _workouts = [];

//   UnmodifiableListView<WorkoutModel> get workouts =>
//       UnmodifiableListView(_workouts);

//   void addWorkout(WorkoutModel workout) {
//     _workouts.add(workout);
//     notifyListeners();
//   }

//   void toggleWorkout(WorkoutModel workout) {
//     workout.toggle();
//     notifyListeners();
//   }

//   void removeWorkout(WorkoutModel workout) {
//     _workouts.remove(workout);
//     notifyListeners();
//   }

//   void clearWorkout() {
//     _selectedWorkouts.clear();
//     for (WorkoutModel workout in workouts) {
//       workout.isSelected = false;
//     }
//   }
// }
