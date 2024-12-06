// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

Widget customTextField({
  required TextEditingController controller,
  required String hintText,
  bool obscureText = false,
  TextInputType keyboardType = TextInputType.text,
}) {
  return TextField(
    controller: controller,
    keyboardType: keyboardType,
    obscureText: obscureText,
    decoration: InputDecoration(
      hintText: hintText,
      border: OutlineInputBorder(),
      filled: true,
      fillColor: Color.fromARGB(255, 253, 217, 246),
      contentPadding: EdgeInsets.all(10),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: const Color.fromARGB(255, 211, 3, 3),
          width: 1.3,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: const Color.fromARGB(255, 246, 122, 143),
          width: 1.0,
        ),
      ),
    ),
  );
}
