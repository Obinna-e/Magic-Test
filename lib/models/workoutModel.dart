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

  void setNumber(int amount) {
    set = amount;
  }

  void setReps(int amount) {
    reps = amount;
  }

  void setWeight(int amount) {
    weight = amount;
  }
}
