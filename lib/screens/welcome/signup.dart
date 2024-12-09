// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crud/custom_widget/elevat_button.dart';
import 'package:firebase_crud/custom_widget/textfield_func.dart';
import 'package:firebase_crud/screens/welcome/loginscr.dart';
import 'package:firebase_crud/wraperpage/wraper.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController signupEmailController = TextEditingController();
  TextEditingController signupPassCodeController = TextEditingController();

  signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: signupEmailController.text,
        password: signupPassCodeController.text,
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.code, snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      print('Try again');
    }
    Get.offAll(Wraperscr());
    setState(() {
      signupEmailController.clear();
      signupPassCodeController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.pink,
        title: Text(
          "Sign Up",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: 30),
            customTextField(
              controller: signupEmailController,
              hintText: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 10),
            customTextField(
              controller: signupPassCodeController,
              hintText: 'Password',
              obscureText: true,
            ),
            SizedBox(height: 30),
            customElevatedButton(
              onPressed: () {
                signUp();
                setState(() {});
              },
              text: 'Register Now',
              backgroundColor: Color.fromARGB(255, 253, 217, 246),
              textColor: Color.fromARGB(255, 187, 2, 2),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Get.offAll(Loginscreen());
              },
              child: RichText(
                text: TextSpan(
                  text: 'Already have an account? ',
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: ' Login',
                      style: TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
