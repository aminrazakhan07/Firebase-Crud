// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crud/homepage/homescr.dart';
import 'package:firebase_crud/screens/welcome/loginscr.dart';
import 'package:flutter/material.dart';

class Wraperscr extends StatefulWidget {
  const Wraperscr({super.key});

  @override
  State<Wraperscr> createState() => _WraperscrState();
}

class _WraperscrState extends State<Wraperscr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Homescreen();
          } else {
            return Loginscreen();
          }
        },
      ),
    );
  }
}
