// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crud/screens/welcome/loginscr.dart';
import 'package:firebase_crud/wraperpage/wraper.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Verifyemailscr extends StatefulWidget {
  const Verifyemailscr({super.key});

  @override
  State<Verifyemailscr> createState() => _VerifyemailscrState();
}

class _VerifyemailscrState extends State<Verifyemailscr> {
  @override
  void initState() {
    super.initState();
    sendVerifylink();
  }

  sendVerifylink() async {
    final user = FirebaseAuth.instance.currentUser;
    await user!.sendEmailVerification().then((value) => {
          Get.snackbar(
            'Verification Email',
            'A link has been sent to your email',
            margin: EdgeInsets.all(30),
            snackPosition: SnackPosition.BOTTOM,
          )
        });
  }

  reload() async {
    await FirebaseAuth.instance.currentUser!.reload().then(
          (value) => {
            Get.offAll(Wraperscr()),
          },
        );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.offAll(Loginscreen());
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink,
        title: Text(
          'Verification Email',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Text(
            'Open your mail and click on the link provided to verify your email & reload the page',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() => reload()),
        child: Icon(Icons.refresh),
      ),
    );
  }
}
