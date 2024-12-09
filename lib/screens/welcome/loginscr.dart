// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crud/custom_widget/elevat_button.dart';
import 'package:firebase_crud/screens/welcome/forgotpass.dart';
import 'package:firebase_crud/screens/welcome/signup.dart';
import 'package:firebase_crud/custom_widget/textfield_func.dart';
import 'package:firebase_crud/wraperpage/wraper.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool isLoading = false;
  signin() async {
    setState(() {
      isLoading = true;
    });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      );
      Get.offAll(Wraperscr());
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'No User Sign Up',
        e.code,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    setState(() {
      isLoading = false;
      emailController.clear();
      passController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.pink,
              title: Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 30),
                      customTextField(
                        controller: emailController,
                        hintText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 10),
                      customTextField(
                        controller: passController,
                        hintText: 'Password',
                        obscureText: true,
                      ),
                      ////////
                      SizedBox(height: 30),
                      customElevatedButton(
                        onPressed: () => signin(),
                        text: 'Sign In',
                        backgroundColor: Color.fromARGB(255, 253, 217, 246),
                        textColor: Color.fromARGB(255, 187, 2, 2),
                      ),
                      SizedBox(height: 30),
                      customElevatedButton(
                        onPressed: () => Get.to(SignupPage()),
                        text: "Register Now",
                        backgroundColor: Color.fromARGB(255, 253, 217, 246),
                        textColor: Color.fromARGB(255, 187, 2, 2),
                      ),
                      SizedBox(height: 30),
                      customElevatedButton(
                        onPressed: () => Get.to(ForgotpassCode()),
                        text: "Forgot Password",
                        backgroundColor: Colors.pink,
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
