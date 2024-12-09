// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crud/custom_widget/elevat_button.dart';
import 'package:firebase_crud/custom_widget/textfield_func.dart';
import 'package:flutter/material.dart';

class ForgotpassCode extends StatefulWidget {
  const ForgotpassCode({super.key});

  @override
  State<ForgotpassCode> createState() => _ForgotpassCodeState();
}

class _ForgotpassCodeState extends State<ForgotpassCode> {
  TextEditingController forgotCodeController = TextEditingController();

  forgotPassCode() async {
    await FirebaseAuth.instance.sendPasswordResetEmail(
      email: forgotCodeController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.pink,
        title: Text(
          "Reset Password",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: 30),
            customTextField(
              controller: forgotCodeController,
              hintText: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 30),
            customElevatedButton(
              onPressed: (() => forgotPassCode()),
              text: "Reset Now",
              backgroundColor: Color.fromARGB(255, 253, 217, 246),
              textColor: Colors.pink[700]!,
            ),
          ],
        ),
      ),
    );
  }
}
