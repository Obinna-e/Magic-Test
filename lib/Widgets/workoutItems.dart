import 'package:flutter/material.dart';
import 'package:magic_seniordev_test/models/workOutData.dart';
import 'package:magic_seniordev_test/models/workoutModel.dart';
import 'package:provider/provider.dart';

class WorkoutItems extends StatefulWidget {
  const WorkoutItems(
      {Key? key,
      required this.img,
      required this.title,
      required this.subtitle,
      required this.isSelected,
      required this.index})
      : super(key: key);

  final String img;
  final String title;
  final String subtitle;
  final bool isSelected;
  final int index;

  @override
  State<WorkoutItems> createState() => _WorkoutItemsState();
}

class _WorkoutItemsState extends State<WorkoutItems> {
  List<WorkoutModel> selectedItems = [];
  @override
  Widget build(BuildContext context) {
    return Consumer<WorkOutData>(builder: (context, data, child) {
      return ListTile(
        leading: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 44,
            minHeight: 44,
            maxWidth: 80,
            maxHeight: 80,
          ),
          child: Image.asset(
            'assets/images/${widget.img}',
            height: 75,
            width: 75,
          ),
        ),
        title: Text(widget.title),
        subtitle: Text(widget.subtitle),
        trailing: context.watch<WorkOutData>().workouts[widget.index].isSelected
            ? Icon(Icons.check_circle, color: Colors.blue)
            : Icon(
                Icons.check_circle_outline,
                color: Colors.grey,
              ),
        onTap: () {
          data.workouts[widget.index].toggle();
          if (data.workouts[widget.index].isSelected == true) {
            data.addWorkout(data.workouts[widget.index]);
          } else if (data.workouts[widget.index].isSelected == false) {
            data.removeWorkout(data.workouts[widget.index]);
          }
        },
      );
    });
  }
}
