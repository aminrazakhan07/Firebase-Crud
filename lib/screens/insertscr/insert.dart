// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud/screens/read.dart/read.dart';
import 'package:flutter/material.dart';

class InsertDatas extends StatefulWidget {
  const InsertDatas({super.key});

  @override
  State<InsertDatas> createState() => _InsertDatasState();
}

class _InsertDatasState extends State<InsertDatas> {
  TextEditingController nameController = TextEditingController();

  ///// Function to add data to Firestore
  Future<void> addData(String value) async {
    if (value.isNotEmpty) {
      await FirebaseFirestore.instance.collection('Students').add({
        'name': value,
      });
      ///// Clear the TextField and SnackBar
      nameController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 1),
          content: Text('Data added successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 3),
          content: Text('Please enter a name!'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                keyboardType: TextInputType.text,
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Name',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Color.fromARGB(255, 253, 217, 246),
                  contentPadding: EdgeInsets.all(10),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 211, 3, 3),
                      width: 1.3,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 246, 122, 143),
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 253, 217, 246),
              ),
              onPressed: () {
                addData(nameController.text);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReadDatas(),
                    ));
              },
              child: Text(
                'Add Data',
                style: TextStyle(
                  color: Color.fromARGB(255, 187, 2, 2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
