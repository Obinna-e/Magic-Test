class WorkoutModel {
  String? img;
  String title;
  String? subtitle;
  bool isSelected;
  int? set;
  int? reps;
  int? weight;

  WorkoutModel({
    this.img,
    required this.title,
    this.subtitle,
    required this.isSelected,
    this.set,
    this.reps,
    this.weight,
  });

  void toggle() {
    isSelected = !isSelected;
  }
}
