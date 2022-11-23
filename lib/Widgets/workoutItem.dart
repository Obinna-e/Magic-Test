import 'package:flutter/material.dart';

class WorkOut extends StatelessWidget {
  const WorkOut({
    Key? key,
    required this.title,
    this.img,
  }) : super(key: key);

  final String title;
  final String? img;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 150,
            ),
            Align(alignment: Alignment.bottomLeft, child: Text(title))
          ],
        ),
      ),
    );
  }
}
