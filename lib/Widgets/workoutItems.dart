// import 'package:flutter/material.dart';
// import 'package:magic_seniordev_test/models/workoutModel.dart';

// Widget WorkoutItems(
//     String img, String title, String subtitle, bool isSelected, int index) {
//   return ListTile(
//     leading: ConstrainedBox(
//       constraints: BoxConstraints(
//         minWidth: 44,
//         minHeight: 44,
//         maxWidth: 80,
//         maxHeight: 80,
//       ),
//       child: Image.asset(
//         'assets/images/${img}',
//         height: 75,
//         width: 75,
//       ),
//     ),
//     title: Text(title),
//     subtitle: Text(subtitle),
//     trailing: isSelected
//         ? Icon(Icons.check_circle, color: Colors.blue)
//         : Icon(
//             Icons.check_circle_outline,
//             color: Colors.grey,
//           ),
//     onTap: () {
//       setState(() {
//         workoutss[index].isSelected = !isSelected;

//         if (isSelected == true) {
//           selectedItems.add(
//               WorkoutModel(widget.img, widget.title, widget.subtitle, true));
//         } else if (isSelected == false) {
//           selectedItems.removeWhere((element) => element.title == widget.title);
//         }

//         print(selectedItems.length);
//       });
//     },
//   );
// }
