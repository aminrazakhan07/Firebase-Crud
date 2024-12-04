// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Login Page'),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Container(
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Color.fromARGB(255, 253, 217, 246),
                    contentPadding: EdgeInsets.all(10),
                    // فوکس ہونے پر باڈر کلر
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(
                            255, 211, 3, 3), // آپ کا فوکس کلر
                        width: 1.3,
                      ),
                    ),
                    // نارمل باڈر کلر
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(
                            255, 246, 122, 143), // نارمل باڈر کلر
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ///////////////
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Container(
                child: TextField(
                  controller: passController,
                  decoration: InputDecoration(
                    hintText: 'PaddCode',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Color.fromARGB(255, 253, 217, 246),
                    contentPadding: EdgeInsets.all(10),
                    // فوکس ہونے پر باڈر کلر
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(
                            255, 211, 3, 3), // آپ کا فوکس کلر
                        width: 1.3,
                      ),
                    ),
                    // نارمل باڈر کلر
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(
                            255, 246, 122, 143), // نارمل باڈر کلر
                        width: 1.0,
                      ),
                    ),
                  ),
                  // ہور کلر
                  style: TextStyle(
                    decorationColor: Colors
                        .blue, // ہور کلر یہاں عام طور پر اسٹائلز کے ساتھ کیا جاتا ہے
                  ),
                ),
              ),
            ),
            ////////
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 253, 217, 246),
              ),
              onPressed: () {},
              child: Text(
                'send',
                style: TextStyle(
                  color: Color.fromARGB(255, 187, 2, 2),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
