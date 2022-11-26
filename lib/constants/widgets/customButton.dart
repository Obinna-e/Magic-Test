import 'package:flutter/material.dart';

import '../styles.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final String title;
  final VoidCallback? onTap;
  final Color? textColor;
  final Color? buttonColor;

  const CustomButton({
    Key? key,
    required this.width,
    required this.title,
    this.onTap,
    this.textColor,
    this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: defaultPadding,
      child: SizedBox(
        width: width,
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(buttonColor ?? Colors.blue)),
            onPressed: onTap,
            child: Text(
              title,
              style: TextStyle(color: textColor ?? Colors.white),
            )),
      ),
    );
  }
}
