class WorkoutModel {
  String img;
  String title;
  String subtitle;
  bool isSelected;

  WorkoutModel({
    required this.img,
    required this.title,
    required this.subtitle,
    required this.isSelected,
  });

  void toggle() {
    isSelected = !isSelected;
  }
}
