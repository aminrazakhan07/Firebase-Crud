// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud/screens/insertscr/insert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class ReadDatas extends StatefulWidget {
  const ReadDatas({super.key});

  @override
  State<ReadDatas> createState() => _ReadDatasState();
}

class _ReadDatasState extends State<ReadDatas> {
  getData() async {
    var result = await FirebaseFirestore.instance.collection('Students').get();
    // print(result.docs);
    return result;
  }

  String updateName = '';

  updateData(id, value) async {
    await FirebaseFirestore.instance
        .collection(
          'Students',
        )
        .doc(id)
        .update({
      'name': value,
    });
    setState(() {});
  }

  ////////
  deleteData(id) async {
    await FirebaseFirestore.instance
        .collection(
          'Students',
        )
        .doc(id)
        .delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Read & Update Data'),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: GestureDetector(
                        onTap: () {
                          Get.defaultDialog(
                            title: 'Update',
                            content: TextField(
                              onChanged: (value) {
                                setState(() {
                                  updateName = value;
                                });
                              },
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  updateData(
                                    snapshot.data.docs[index].id,
                                    updateName,
                                  );

                                  Get.back();
                                },
                                child: Text('Update Name'),
                              )
                            ],
                          );
                        },
                        child: Icon(Icons.update_outlined),
                      ),
                      title: Text('${snapshot.data.docs[index]['name']}'),
                      // subtitle: Text('${snapshot.data.docs[index].id}'),

                      trailing: GestureDetector(
                        onLongPress: () {
                          deleteData(snapshot.data.docs[index].id);
                          setState(() {});

                          /// SnackBar
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Deleted successful '),
                              duration: Duration(seconds: 1),
                              action: SnackBarAction(
                                label: 'Undo',
                                textColor: Colors.white,
                                onPressed: () {
                                  print('Undo');
                                },
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                        },
                        child: Icon(
                          Icons.delete_forever_sharp,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return Center(
              child: SpinKitFoldingCube(
                duration: Duration(seconds: 3),
                color: Colors.black,
                size: 50.0,
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InsertDatas(),
              ));
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
