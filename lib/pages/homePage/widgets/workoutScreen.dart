import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:magic_seniordev_test/constants/styles.dart';
import '../../modalPage/customModal.dart';
import 'popularWorkOuts.dart';

class WorkOutScreen extends StatelessWidget {
  const WorkOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: defaultPadding,
          child: Text(
            'Start Workout',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        const Padding(
          padding: defaultPadding,
          child: Text(
            'Quick Start',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: defaultPadding,
          child: Container(
            width: width * 0.99,
            child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return ModalBottomSheet();
                      });
                },
                child: Text('Create new workout')),
          ),
        ),
        const Padding(
          padding: defaultPadding,
          child: Text(
            'Popular Workouts',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        const PopularWorkOuts()
      ],
    );
  }
}
