import 'package:flutter/material.dart';

import './workoutItem.dart';

class PopularWorkOuts extends StatelessWidget {
  const PopularWorkOuts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        scrollDirection: Axis.vertical,
        crossAxisCount: 2,
        children: [
          WorkOut(
            title: 'CHEST',
          ),
          WorkOut(
            title: 'SHOULDER',
          ),
          WorkOut(
            title: 'BICEP',
          ),
          WorkOut(
            title: 'TRICEP',
          ),
          WorkOut(
            title: 'LEG',
          ),
          WorkOut(
            title: 'BACK',
          ),
          WorkOut(
            title: 'ABS',
          ),
          WorkOut(
            title: 'CARDIO',
          ),
        ],
      ),
    );
  }
}
