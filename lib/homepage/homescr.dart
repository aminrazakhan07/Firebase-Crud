// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crud/screens/welcome/loginscr.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late final mdqry = MediaQuery.of(context).size;
  final user = FirebaseAuth.instance.currentUser;

  signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      setState(() {});
    } catch (e) {
      setState(() {});
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.all(30),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: Duration(seconds: 3),
        animationDuration: Duration(seconds: 1),
        borderRadius: 10,
        borderWidth: 2,
        borderColor: Colors.white,
        icon: Icon(Icons.error, color: Colors.white),
      );

      setState(() {});
    }
    Get.offAll(
      Loginscreen(),
      transition: Transition.cupertino,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
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
          'Welcome',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: (() => signOut()),
            icon: Icon(
              Icons.power_settings_new,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: mdqry.height * 0.07,
              width: mdqry.width / 0.5,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.pink[50]!,
                    blurRadius: 10,
                  ),
                ],
                border: Border.all(color: Colors.pink[50]!),
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  "${user?.email}",
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
