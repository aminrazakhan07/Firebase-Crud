// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crud/homepage/homescr.dart';
import 'package:firebase_crud/screens/welcome/loginscr.dart';
import 'package:firebase_crud/wraperpage/verifyemail.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Wraperscr extends StatefulWidget {
  const Wraperscr({super.key});

  @override
  State<Wraperscr> createState() => _WraperscrState();
}

class _WraperscrState extends State<Wraperscr> {
  emailVaeified() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
    Get.offAll(Verifyemailscr());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            if (snapshot.data!.emailVerified) {
              return Homescreen();
            } else {
              return Verifyemailscr();
            }
          } else {
            return Loginscreen();
          }
        },
      ),
    );
  }
}
