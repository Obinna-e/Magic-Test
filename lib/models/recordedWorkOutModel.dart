import './workoutModel.dart';

class RecordedWorkOutModel {
  WorkoutModel workout;
  String weigth;
  String repetition;
  String set;

  RecordedWorkOutModel({
    required this.set,
    required this.workout,
    required this.repetition,
    required this.weigth,
  });
}
