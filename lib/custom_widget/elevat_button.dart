import 'package:flutter/material.dart';

Widget customElevatedButton({
  required VoidCallback onPressed,
  required String text,
  Color backgroundColor = Colors.blue,
  Color textColor = Colors.white,
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
    ),
    onPressed: onPressed,
    child: Text(
      text,
      style: TextStyle(color: textColor),
    ),
  );
}
