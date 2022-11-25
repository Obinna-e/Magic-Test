import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:magic_seniordev_test/Widgets/workouts.dart';
import 'package:magic_seniordev_test/models/recordedWorkOutModel.dart';

class RecordedWorkOutData with ChangeNotifier {
  List<RecordedWorkOutModel> _recordedworkouts = [];

  UnmodifiableListView<RecordedWorkOutModel> get recordedworkouts =>
      UnmodifiableListView(_recordedworkouts);

  void addWorkout(RecordedWorkOutModel workout) {
    _recordedworkouts.add(workout);
    notifyListeners();
  }

  void removeWorkout(RecordedWorkOutModel workout) {
    _recordedworkouts.remove(workout);
    notifyListeners();
  }

  void clearWorkout() {
    _recordedworkouts.clear();
  }
}
