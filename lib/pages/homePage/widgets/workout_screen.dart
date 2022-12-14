import 'package:flutter/material.dart';

import '../../../constants/styles.dart';
import '../../../constants/widgets/custom_button.dart';
import '../../modalPage/custom_modal.dart';
import 'popular_work_outs.dart';

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
            key: Key('start workout'),
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
          child: SizedBox(
              width: width * 0.99,
              child: CustomButton(
                title: 'Create New Workout',
                width: width * 0.98,
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) {
                        return const ModalBottomSheet(
                          isAnEdit: false,
                        );
                      });
                },
              )),
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
