// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:paginate_firestore_plus/paginate_firestore.dart';

class PaginateScreen extends StatefulWidget {
  const PaginateScreen({super.key});

  @override
  State<PaginateScreen> createState() => _PaginateScreenState();
}

class _PaginateScreenState extends State<PaginateScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PaginateFirestore(
          itemBuilder: (context, dynamic snapshot, index) {
            return Card(
              margin: EdgeInsets.only(top: 20, left: 10, right: 10),
              child: ListTile(
                title: Text("${snapshot[index]['name']}"),
                subtitle: Text("${snapshot[index].id}"),
              ),
            );
          },
          query: FirebaseFirestore.instance.collection('Students'),
          itemBuilderType: PaginateBuilderType.listView,
        ),
      ),
    );
  }
}
