import 'dart:collection';
import 'package:flutter/material.dart';

import 'package:magic_seniordev_test/models/recordedWorkOutModel.dart';
import 'package:magic_seniordev_test/models/workoutModel.dart';
import 'package:magic_seniordev_test/pages/homePage/widgets/workouts.dart';

class RecordedWorkOutProvider extends ChangeNotifier {
  List<List<WorkoutModel>> recordedWorkouts = [];

  // List<WorkoutModel> _userWorkout = [];

  // UnmodifiableListView<WorkoutModel> get usersWorkout =>
  //     UnmodifiableListView(_userWorkout);

  // void set userWorkout(UnmodifiableListView workout) {
  //   _recordedworkouts.add(workout);
  //   notifyListeners();
  // }

  // UnmodifiableListView<dynamic> get recordedWorkouts =>
  //     UnmodifiableListView(_recordedworkouts);

  // void addUserWorkout(WorkoutModel workout) {
  //   _userWorkout.add(workout);
  // }

  void addWorkout(List<WorkoutModel> workout) {
    recordedWorkouts.add(List.from(workout));
    notifyListeners();
  }

  void removeWorkout(int index) {
    recordedWorkouts.removeAt(index);
    notifyListeners();
  }

  // void clearWorkout(WorkoutModel workout) {
  //   _userWorkout.clear();
  // }
}





//   void addWorkout(UnmodifiableListView<WorkoutModel> workout) {
//     recordedworkouts.add(workout);
//     notifyListeners();
//   }

  

//   void removeWorkout(int index) {
//     recordedworkouts.removeAt(index);
//     notifyListeners();
//   }

//   void clearWorkout(int index) {
//     recordedworkouts[index].clear();
//   }
// }
