import 'package:flutter/material.dart';

import 'workouts.dart';

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
        children: const [
          WorkOut(
            title: 'CHEST',
            img: 'chest.jpeg',
          ),
          WorkOut(
            title: 'SHOULDER',
            img: 'shoulder.png',
          ),
          WorkOut(
            title: 'BICEP',
            img: 'bicep.jpg',
          ),
          WorkOut(
            title: 'TRICEP',
            img: 'tricep.jpeg',
          ),
          WorkOut(
            title: 'LEG',
            img: 'legs.jpg',
          ),
          WorkOut(
            title: 'BACK',
            img: 'back.jpg',
          ),
          WorkOut(
            title: 'ABS',
            img: 'abs.jpg',
          ),
          WorkOut(
            title: 'CARDIO',
            img: 'cardio.jpeg',
          ),
        ],
      ),
    );
  }
}
